#!/bin/bash

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado

DIR=inkscape

apt-get build-dep inkscape
apt-get install ubuntu-dev-tools bzr-doc bzrtools bzr-rebase bzr-search bzr-stats libdbus-c++-dev libdbus-1-dev libdbusmenu-tools  libcdr-dev libcdr-doc libcdr-tools 

if [ -d $DIR ]; then
	echo "Directory exists - UPDATING"
	cd $DIR
	#bzr update
	#bzr pull
	bzr update
else 
	echo "Directory does not exists - CHECKING OUT"
	#bzr co https://inkscape.bzr.sourceforge.net/bzrroot/inkscape/inkscape/trunk inkscape
#	bzr branch lp:inkscape
	bzr checkout lp:inkscape
	cd $DIR
fi

apt-get build-dep inkscape
apt-get install libgc-dev libgnomevfs2-dev libgtkmm-2.4-dev libxslt1-dev libsigc++-2.0-dev libgsl0-dev libboost-dev libpopt-dev libpoppler-glib-dev libwpg-dev imagemagick libmagick++-dev create-resources 

./autogen.sh
./configure --prefix=/opt/bzr/inkscape --enable-lcms --enable-inkboard --with-gnome-vfs  --with-perl  --with-python && make && make install

cat > /usr/share/applications/inkscape-bzr.desktop << EOF
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Inkscape Vector Graphics Editor - SVN
Comment=Create and edit Scalable Vector Graphics images - SVN
Type=Application
Categories=Application;Graphics;VectorGraphics;GTK;
MimeType=image/svg+xml
Exec=/opt/bzr/inkscape/bin/inkscape %F
TryExec=/opt/bzr/inkscape/bin/inkscape
Terminal=false
StartupNotify=true
Icon=inkscape.png
EOF

cat > /usr/local/bin/inkscape-bzr << EOF
#!/bin/bash
cd /opt/inkscape-bzr/bin/
./inkscape $1
EOF
chmod a+x /usr/local/bin/inkscape-bzr


killall -9 gnome-panel
