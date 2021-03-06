#!/bin/bash

#apt-get install subversion build-essential gettext libxi-dev libsndfile1-dev libpng12-dev libfftw3-dev libopenexr-dev libopenjpeg-dev libopenal-dev libalut-dev libvorbis-dev libglu1-mesa-dev libsdl1.2-dev libfreetype6-dev libtiff4-dev libsamplerate0-dev libavdevice-dev libavformat-dev libavutil-dev libavcodec-dev libjack-jackd2-dev libswscale-dev libx264-dev libmp3lame-dev python3.2-dev libspnav-dev cmake cmake-curses-gui subversion-tools subversion cmake libopenal-dev libopenimageio-dev openimageio-tools nvidia-cuda-dev libnvidia-compiler nvidia-cuda-dev python-pycuda python3-all-dev python3-pygame

#apt-get install libboost-all-dev libopenimageio-dev openimageio-tools

#apt-get build-dep blender 


mkdir -p /usr/src/frustrado/blender
cd /usr/src/frustrado/blender
#
if [ -d /usr/src/frustrado/blender/blender ]
then
        cd blender
	git pull --rebase
	git submodule foreach git pull --rebase origin master
        cd ..
else
	git clone http://git.blender.org/blender.git
	cd blender
	git submodule update --init --recursive
	git submodule foreach git checkout master
	git submodule foreach git pull --rebase origin maste
	cd ..
fi


cd /usr/src/frustrado/blender


rm -fr build-blender
mkdir build-blender



cd /usr/src/frustrado/blender 

cd build-blender

bash ../blender/build_files/build_environment/install_deps.sh --with-all --with-opencollada --libyaml-cpp-ver=0.3

cmake ../blender -DCMAKE_INSTALL_PREFIX=/opt/git/blender -DWITH_INSTALL_PORTABLE=OFF -DWITH_INSTALL_PLAYER=ON \
>>>>>>> 0b47a44e1723d9f6ef15d27aa34b4937986a61b5
  -DOPENEXR_ROOT_DIR=/opt/lib/openexr \
  -DOPENIMAGEIO_ROOT_DIR=/opt/lib/oiio \
  -DWITH_CYCLES_OSL=ON \
  -DWITH_LLVM=ON \
  -DLLVM_VERSION=3.3 \
  -DCYCLES_OSL=/opt/lib/osl \
  -DWITH_OPENCOLLADA=ON \
  -DWITH_CODEC_FFMPEG=ON \
  -DFFMPEG_LIBRARIES='avformat;avcodec;avutil;avdevice;swscale;rt;theoraenc;theoradec;theora;vorbis;vorbisenc;vorbisfile;ogg;xvidcore;vpx;mp3lame;x264;openjpeg' \
  -DFFMPEG=/opt/lib/ffmpeg \
  -DWITH_MOD_OCEANSIM=ON \
  -DWITH_FFTW3=ON \
&& make && make install

