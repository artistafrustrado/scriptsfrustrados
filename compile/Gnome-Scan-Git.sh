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

apt-get install gtk-doc-tools automake1.7 libopenraw-dev libavformat-dev python-gtk2-dev python-dev libwebkit-dev libpoppler-dev librsvg2-dev libxpm-dev libhal-dev libdbus-1-dev libtiff4-dev libxmuu-dev libwmf-dev libaa1-dev liblcms1-dev  libmng-dev lprof libexif-dev libhal-dev libhal-storage-dev libasound2-dev libpoppler-dev  libpoppler-glib-dev  poppler-utils libdbus-glib-1-dev libwebkit-dev asciidoc enscript liblua50-dev libsdl1.2-dev graphviz libspiro-dev

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado

# GLIB
#co_compile_install "glib" 

export PATH=/opt/gimp-git/bin:$PATH
export LD_LIBRARY_PATH=/opt/gimp-git/lib
export PKG_CONFIG_PATH=/opt/gimp-git/lib/pkgconfig

# GTK 
#co_compile_install "gtk+" "--with-xinput=yes --disable-gtk-doc"
# BABL

co_compile_install gobject-introspection
co_compile_install gir-repository
co_compile_install gnome-scan

