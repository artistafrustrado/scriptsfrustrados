#!/bin/bash

sudo apt-get install subversion build-essential gettext  libxi-dev libsndfile1-dev libpng12-dev libfftw3-dev libopenexr-dev libopenjpeg-dev  libopenal-dev libalut-dev libvorbis-dev libglu1-mesa-dev libsdl1.2-dev libfreetype6-dev libtiff4-dev libsamplerate0-dev libavdevice-dev libavformat-dev libavutil-dev libavcodec-dev libjack-dev libswscale-dev libx264-dev libmp3lame-dev python3.2-dev  libspnav-dev


mkdir -p /usr/src/frustrado/blender-svn
cd /usr/src/frustrado/blender-svn

svn co https://svn.blender.org/svnroot/bf-blender/trunk/blender

sudo apt-get install cmake cmake-curses-gui

#cd /usr/src/frustrado/blender-svn/blender

mkdir /usr/src/frustrado/blender-svn/build
cd /usr/src/frustrado/blender-svn/build
cmake ../blender -DCMAKE_INSTALL_PREFIX=/opt/blender 
make && make install
