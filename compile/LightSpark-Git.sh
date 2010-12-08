#!/bin/bash


apt-get install cmake nasm llvm-dev libsdl1.2-dev libgl1-mesa-dev libxext-dev libcurl4-openssl-dev libxml2-dev zlib1g-dev libnspr4-dev libavcodec-dev libpcre3-dev libftgl-dev libglew1.5-dev xulrunner-dev libgtkglext1-dev libffi-dev

cd /usr/src/frustrado
git clone git://github.com/alexp-sssup/lightspark.git lightspark
cd lightspark
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCOMPILE_PLUGIN=1 ..
make
make install
