#!/bin/bash

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado

DIR=inkscape

if [ -d $DIR ]; then
	echo "Directory exists - UPDATING"
	cd $DIR
	svn update
else 
	echo "Directory does not exists - CHECKING OUT"
	svn co https://inkscape.svn.sourceforge.net/svnroot/inkscape/inkscape/trunk inkscape
	cd $DIR
fi

apt-get install libgc-dev libgnomevfs2-dev libgtkmm-2.4-dev libxslt1-dev libsigc++-2.0-dev libgsl0-dev libboost-dev libpopt-dev libpoppler-glib-dev libwpg-dev imagemagick libmagick++-dev create-resources 

./autogen.sh
./configure --prefix=/opt/inkscape-svn --enable-lcms --enable-inkboard --with-gnome-vfs  --with-perl  --with-python && make && make install
