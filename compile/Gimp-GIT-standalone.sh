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
		git clone --depth 3 git://git.gnome.org/$DIR
		cd $DIR
	fi

	if [ -n $COMMAND ]
	then
		eval $COMMAND
	fi
	make clean
	./autogen.sh
	pwd
	./configure --prefix=/opt/git/gimp --enable-introspection=no $PARAMS && make &&  make install
	cd ..
}

#apt-get build-dep gimp
#apt-get install gtk-doc-tools automake1.7 libopenraw-dev libavformat-dev python-gtk2-dev python-dev libwebkit-dev libpoppler-dev librsvg2-dev libxpm-dev libhal-dev libdbus-1-dev libtiff4-dev libxmuu-dev libwmf-dev libaa1-dev liblcms1-dev  libmng-dev lprof libexif-dev libhal-dev libhal-storage-dev libasound2-dev libpoppler-dev  libpoppler-glib-dev  poppler-utils libdbus-glib-1-dev libwebkit-dev asciidoc enscript liblua50-dev libsdl1.2-dev graphviz libspiro-dev

#apt-get build-dep gimp

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado

# GLIB
#co_compile_install "glib" 

export PATH=/opt/git/gimp/bin:$PATH
export LD_LIBRARY_PATH=/opt/git/gimp/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/opt/git/gimp/lib/pkgconfig:$PKG_CONFIG_PATH

#export GEGL_CFLAGS=/opt/git/gimp/bin 
#export GEGL_LIBS=/opt/git/gimp/lib 
#export LD_RUN_PATH=/opt/git/gimp/lib:$LD_RUN_PATH 
#export PKG_CONFIG_PATH=/opt/git/gimp/lib/pkgconfig/

PREFIX=/opt/git/gimp
export PATH="$PREFIX/bin:$PATH" 
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH" 
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH" 
export ACLOCAL_FLAGS="-I $PREFIX/share/aclocal $ACLOCAL_FLAGS"

# BABL
co_compile_install "babl" 
co_compile_install "babl" 
# GEGL
#co_compile_install "gegl" "" "sed -r 's:#include <ffmpeg/avformat.h>:#include <libavformat/avformat.h>:g' -i operations/external/ff-load.c" 
co_compile_install "gegl" 
#co_compile_install "babl" 
co_compile_install "gegl" 
# GIMP
co_compile_install "gimp" "--enable-gimp-remote --prefix=/opt/git/gimp/  --with-gimpdir=.gimp-git" 


cat > /usr/share/applications/git/gimp.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=GNU Image Manipulation Program - GIT
GenericName=Image Editor - GIT
Comment=Create images and edit photographs - GIT
Exec=/opt/git/gimp/bin/gimp-2.7 %U
TryExec=/opt/git/gimp/bin/gimp-2.7
Icon=/opt/git/gimp/share/icons/hicolor/48x48/apps/gimp.png
Terminal=false
Categories=Graphics;2DGraphics;RasterGraphics;GTK;
StartupNotify=true
MimeType=application/postscript;application/pdf;image/bmp;image/g3fax;image/gif;image/x-fits;image/pcx;image/x-portable-anymap;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/x-psd;image/x-sgi;image/x-tga;image/x-xbitmap;image/x-xwindowdump;image/x-xcf;image/x-compressed-xcf;image/tiff;image/jpeg;image/x-psd;image/png;image/x-icon;image/x-xpixmap;image/svg+xml;image/x-wmf;
EOF

killall -9 gnome-panel
