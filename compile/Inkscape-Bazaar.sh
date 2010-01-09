#!/bin/bash

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado

DIR=inkscape

apt-get install ubuntu-dev-tools bzr-doc bzrtools bzr-rebase bzr-search bzr-stats


if [ -d $DIR ]; then
	echo "Directory exists - UPDATING"
	cd $DIR
	#svn update
	bzr pull
else 
	echo "Directory does not exists - CHECKING OUT"
	#svn co https://inkscape.svn.sourceforge.net/svnroot/inkscape/inkscape/trunk inkscape
	bzr branch lp:inkscape
	cd $DIR
fi

apt-get install libgc-dev libgnomevfs2-dev libgtkmm-2.4-dev libxslt1-dev libsigc++-2.0-dev libgsl0-dev libboost-dev libpopt-dev libpoppler-glib-dev libwpg-dev imagemagick libmagick++-dev create-resources 

./autogen.sh
./configure --prefix=/opt/inkscape-svn --enable-lcms --enable-inkboard --with-gnome-vfs  --with-perl  --with-python && make && make install

cat >> /usr/share/applications/inkscape-svn.desktop << EOF
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Inkscape Vector Graphics Editor - SVN
Comment=Create and edit Scalable Vector Graphics images - SVN
Type=Application
Categories=Application;Graphics;VectorGraphics;GTK;
MimeType=image/svg+xml
Exec=/opt/inkscape-svn/bin/inkscape %F
TryExec=/opt/inkscape-svn/bin/inkscape
Terminal=false
StartupNotify=true
Icon=inkscape.png
EOF

killall -9 gnome-panel
