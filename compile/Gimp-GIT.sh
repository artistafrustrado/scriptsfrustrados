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
		#svn update
		git pull
	else 
		echo "Directory does not exists - CHECKING OUT"
		#svn checkout "http://svn.gnome.org/svn/$DIR/trunk" "$DIR"
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

#apt-get install gtk-doc-tools automake1.7 libopenraw-dev libavformat-dev python-gtk2-dev python-dev libwebkit-dev libpoppler-dev librsvg2-dev libxpm-dev libhal-dev libdbus-1-dev libtiff4-dev libxmuu-dev libwmf-dev libaa1-dev liblcms1-dev  libmng-dev lprof libexif-dev libhal-dev libhal-storage-dev libasound2-dev libpoppler-dev  libpoppler-glib-dev  poppler-utils libdbus-glib-1-dev


#
#git clone git://anongit.freedesktop.org/git/cairo
#git clone git://anongit.freedesktop.org/git/pixman.git
#
#

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado


# GLIB
co_compile_install "glib" 

export PATH=/opt/gimp-git/bin:$PATH
export LD_LIBRARY_PATH=/opt/gimp-git/lib
export PKG_CONFIG_PATH=/opt/gimp-git/lib/pkgconfig

# GTK 
co_compile_install "gtk+" "--with-xinput=yes --disable-gtk-doc"
# BABL
co_compile_install "babl" 
# GEGL
co_compile_install "gegl" "" "sed -r 's:#include <ffmpeg/avformat.h>:#include <libavformat/avformat.h>:g' -i operations/external/ff-load.c" 
# GIMP
co_compile_install "gimp" "--enable-gimp-remote --prefix=/opt/gimp-git/  --with-gimpdir=.gimp-git" 


cat >> /usr/share/applications/gimp-git.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=GNU Image Manipulation Program - GIT
GenericName=Image Editor - GIT
Comment=Create images and edit photographs - GIT
Exec=/opt/gimp-git/bin/gimp-2.7 %U
TryExec=/opt/gimp-git/bin/gimp-2.7
Icon=/opt/gimp-git/share/icons/hicolor/scalable/apps/gimp.svg
Terminal=false
Categories=Graphics;2DGraphics;RasterGraphics;GTK;
StartupNotify=true
MimeType=application/postscript;application/pdf;image/bmp;image/g3fax;image/gif;image/x-fits;image/pcx;image/x-portable-anymap;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/x-psd;image/x-sgi;image/x-tga;image/x-xbitmap;image/x-xwindowdump;image/x-xcf;image/x-compressed-xcf;image/tiff;image/jpeg;image/x-psd;image/png;image/x-icon;image/x-xpixmap;image/svg+xml;image/x-wmf;
EOF

killall -9 gnome-panel
