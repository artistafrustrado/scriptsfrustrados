#!/bin/bash

#apt-get install subversion build-essential gettext libxi-dev libsndfile1-dev libpng12-dev libfftw3-dev libopenexr-dev libopenjpeg-dev libopenal-dev libalut-dev libvorbis-dev libglu1-mesa-dev libsdl1.2-dev libfreetype6-dev libtiff4-dev libsamplerate0-dev libavdevice-dev libavformat-dev libavutil-dev libavcodec-dev libjack-jackd2-dev libswscale-dev libx264-dev libmp3lame-dev python3.2-dev libspnav-dev cmake cmake-curses-gui subversion-tools subversion cmake libopenal-dev

mkdir -p /usr/src/frustrado/blender-cycles
cd /usr/src/frustrado/blender-cycles

#mkdir boost
#cd boost
##wget http://ufpr.dl.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2
#tar -jxvf boost_1_49_0.tar.bz2

#cd boost_1_49_0/
#./bootstrap.sh
#./bjam -j4 variant=release link=static threading=multi --with-filesystem --with-thread --with-regex --with-system --with-date_time stage install --prefix=../
#cd ../..

#git clone git://github.com/OpenImageIO/oiio.git
cd oiio
#git checkout RB-0.10
mkdir -p build/linux
cd build/linux
cmake ../../src/ -DBUILDSTATIC=1 -DBOOST_CUSTOM=1 -DBoost_INCLUDE_DIRS=`pwd`/../../../boost/include/ -DBoost_LIBRARY_DIRS=`pwd`/../../../boost/lib -DBoost_LIBRARIES="boost_date_time;boost_filesystem;boost_thread;boost_regex;boost_system" -DCMAKE_INSTALL_PREFIX=`pwd`/../../dist/linux
make -j4 install
cd ../../..


#svn co https://svn.blender.org/svnroot/bf-blender/trunk/blender/ blender
cd blender
svn update
cd ..

rm -fr build
mkdir build
cd build
cmake ../blender  -DCMAKE_INSTALL_PREFIX=/opt/blender-cycles -DWITH_INSTALL_PORTABLE=OFF  \
	-DOPENIMAGEIO_ROOT_DIR=../oiio/dist/linux -DBOOST_ROOT=../boost -DBOOST_CUSTOM=1 -DBoost_INCLUDE_DIRS=`pwd`/../boost/include/ \
	-DBoost_LIBRARY_DIRS=`pwd`/../boost/lib \
	-DBoost_LIBRARIES="`pwd`/../boost/lib/libboost_date_time.a;`pwd`/../boost/lib/libboost_filesystem.a;`pwd`/../boost/lib/libboost_thread.a;`pwd`/../boost/lib/libboost_regex.a;`pwd`/../boost/lib/libboost_system.a"
make -j4 install

#if [ -d /usr/src/frustrado/blender/blender ]
#then 
#	cd blender
#	svn update
#	cd ..
#else
#	svn co https://svn.blender.org/svnroot/bf-blender/trunk/blender
#fi
#rm -fr build-blender
#mkdir build-blender
#cd build-blender

#cmake ../blender -DCMAKE_INSTALL_PREFIX=/opt/blender -DWITH_INSTALL_PORTABLE=OFF && make && make install 

#              -DCMAKE_INSTALL_PREFIX=/opt/blender \
#              -DWITH_INSTALL_PORTABLE=OFF \
#              -DWITH_BUILDINFO=OFF \
#              -DWITH_GAMEENGINE=OFF
