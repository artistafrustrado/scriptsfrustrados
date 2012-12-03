#!/bin/bash

apt-get install subversion build-essential gettext libxi-dev libsndfile1-dev libpng12-dev libfftw3-dev libopenexr-dev libopenjpeg-dev libopenal-dev libalut-dev libvorbis-dev libglu1-mesa-dev libsdl1.2-dev libfreetype6-dev libtiff4-dev libsamplerate0-dev libavdevice-dev libavformat-dev libavutil-dev libavcodec-dev libjack-jackd2-dev libswscale-dev libx264-dev libmp3lame-dev python3.2-dev libspnav-dev cmake cmake-curses-gui subversion-tools subversion cmake libopenal-dev libopenimageio-dev openimageio-tools nvidia-cuda-dev libnvidia-compiler nvidia-cuda-dev python-pycuda


mkdir -p /usr/src/frustrado/blender-freestyle
cd /usr/src/frustrado/blender-freestyle 

if [ -d /usr/src/frustrado/blender-freestyle/blender ]
then 
	cd blender
	svn update
	cd ..
else
	svn co https://svn.blender.org/svnroot/bf-blender/branches/soc-2008-mxcurioni/ blender
fi
rm -fr build-blender
mkdir build-blender
cd build-blender

cmake ../blender -DCMAKE_INSTALL_PREFIX=/opt/blender-freestyle -DWITH_INSTALL_PORTABLE=OFF && make && make install 

#              -DCMAKE_INSTALL_PREFIX=/opt/blender \
#              -DWITH_INSTALL_PORTABLE=OFF \
#              -DWITH_BUILDINFO=OFF \
#              -DWITH_GAMEENGINE=OFF
