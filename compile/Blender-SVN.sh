#!/bin/bash

apt-get install python2.5-dev scons  subversion  build-essential yasm gettext libxi-dev libopenexr-dev libopenjpeg-dev libpng12-dev libopenal-dev libalut-dev libglu1-mesa-dev libsdl-dev libfreetype6-dev libtiff4-dev libsamplerate0-dev cmake cmake-curses-gui 

mkdir -p /usr/src/frustrado/svn/blender
cd /usr/src/frustrado/svn/blender

svn checkout https://svn.blender.org/svnroot/bf-blender/trunk/blender
apt-get build-dep blender

cd blender

rm -f blender/CMakeCache.txt 
mkdir cmake-make 
cd cmake-make
cmake -G "Unix Makefiles" ../
make

echo "BF_OPENAL_LIB = 'openal alut'" >> user-config.py
python scons/scons.py

ln -s install/linux2/blender ./blender


