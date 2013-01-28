#!/bin/bash

PREFIX=/opt/git/gimp
export PATH="$PREFIX/bin:$PATH" 
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH" 
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH" 
export ACLOCAL_FLAGS="-I $PREFIX/share/aclocal $ACLOCAL_FLAGS"

# GTK 
#co_compile_install "gtk+" "--with-xinput=yes --disable-gtk-doc"

apt-get build-dep mypaint libjson0-dev libjsoncpp-dev

cd /usr/src/frustrado

if [ -d /usr/src/frustrado/mypaint ]
then
	cd mypaint
	git pull origin master
else
	git clone --depth 3  git://gitorious.org/mypaint/mypaint.git
cd mypaint
fi

scons prefix=/opt/git/mypaint install

