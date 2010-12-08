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
		git clone http://download.gna.org/colorscheme/agave.git agave
		cd $DIR
	fi

	if [ -n $COMMAND ]
	then
		eval $COMMAND
	fi

	#./autogen.sh
	pwd
	./autogen.sh --prefix=/opt/git/agave $PARAMS && make &&  make install
	cd ..
}

#git clone http://download.gna.org/colorscheme/agave.git agave

#apt-get install gtk-doc-tools automake1.7 libopenraw-dev libavformat-dev python-gtk2-dev python-dev libwebkit-dev libpoppler-dev librsvg2-dev libxpm-dev libhal-dev libdbus-1-dev libtiff4-dev libxmuu-dev libwmf-dev libaa1-dev liblcms1-dev  libmng-dev lprof libexif-dev libhal-dev libhal-storage-dev libasound2-dev libpoppler-dev  libpoppler-glib-dev  poppler-utils libdbus-glib-1-dev

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado

# GTK 
co_compile_install "agave" 

cat >> /usr/share/applications/agave-git.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Agave GIT
GenericName=Colorscheme selector - GIT
Comment=Create color schemes - GIT
Exec=/opt/git/agave/bin/agave
TryExec=/opt/git/agave/bin/agave
Icon=/opt/gimp-git/share/icons/hicolor/scalable/apps/gimp.svg
Terminal=false
Categories=Graphics;2DGraphics;GTK;
StartupNotify=true
EOF

killall -9 gnome-panel
