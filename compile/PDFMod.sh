#!/bin/bash

co_compile_install()
{
	DIR=$1
	PARAMS=$2
	COMMAND=$3
	echo "Installing $DIR"

	# bash check if directory exists
	if [ -d $DIR ]; then
		echo "Directory exists - UPDATING"
		cd $DIR
		git pull
	else 
		echo "Directory does not exists - CHECKING OUT"
		git clone git://git.gnome.org/$DIR
		cd $DIR
	fi

	if [ -n $COMMAND ]
	then
		eval $COMMAND
	fi

	./autogen.sh
	pwd
	./configure --prefix=/opt/gimp-git $PARAMS && make &&  make install
	cd ..
}

apt-get install gnome-sharp2 libhyena-cil-dev 

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado

co_compile_install "pdfmod" 
