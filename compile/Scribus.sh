#!/bin/bash

mkdir /usr/src/frustrado/scribus -p
mkdir /opt/svn/scribus -p
cd /usr/src/frustrado/scribus

DIR="Scribus"

if [ -d $DIR ]; then
	echo "Directory exists - UPDATING"
	cd $DIR
	svn update
else 
	echo "Directory does not exists - CHECKING OUT"
	svn co svn://scribus.info/Scribus/trunk/Scribus
	cd $DIR
fi
echo "COMPILING"
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/svn/scribus
make
make install

