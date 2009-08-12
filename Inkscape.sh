#!/bin/bash

#svn co https://inkscape.svn.sourceforge.net/svnroot/inkscape/inkscape/trunk inkscape

#apt-get install libgc-dev libgnomevfs2-dev libgtkmm-2.4-dev libxslt1-dev libsigc++-2.0-dev libgsl0-dev libboost-dev libpopt-dev libpoppler-glib-dev libwpg-dev imagemagick libmagick++-dev create-resources 
cd inkscape
svn update
./autogen.sh
./configure --prefix=/opt/inkscape-svn --enable-lcms --enable-inkboard --with-gnome-vfs  --with-perl  --with-python && make && make install
