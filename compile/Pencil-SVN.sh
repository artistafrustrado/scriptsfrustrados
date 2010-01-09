#!/bin/bash

apt-get install gcc g++ cmake subversion libqt4-dev libphonon-dev

mkdir /usr/src/frustrado/pencil -p
mkdir /opt/svn/pencil/bin -p
cd /usr/src/frustrado/pencil

DIR="pencil-planner"

if [ -d $DIR ]; then
	echo "Directory exists - UPDATING"
	cd $DIR
	svn update
else 
	echo "Directory does not exists - CHECKING OUT"
	#svn co svn://pencil.info/Pencil/trunk/Pencil
	svn co https://pencil-planner.svn.sourceforge.net/svnroot/pencil-planner pencil-planner 
	cd $DIR
fi
echo "COMPILING"

cd trunk
qmake-qt4 
make
make install

cp release/Pencil /opt/svn/pencil/bin

cat >> /usr/share/applications/pencil-svn.desktop << EOF
[Desktop Entry]
Type=Application
Name=PencilSVN
Comment=Pencil 2D animation (SVN)
Exec=/opt/svn/pencil/bin/pencil %f
Icon=/usr/share/icons/gnome/scalable/actions/format-text-direction-ltr.svg
Terminal=false
MimeType=application/vnd.pencil-ng;
StartupWMClass=pencil-ng
X-AppInstall-Package=pencil-ng
X-AppInstall-Section=main
StartupNotify=false
EOF

