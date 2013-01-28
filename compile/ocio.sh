#!/bin/bash

#mkdir -p /usr/src/frustrado/calligra
#cd /usr/src/frustrado/calligra

#git clone --depth=3 git://github.com/imageworks/OpenColorIO.git

rm -fr /tmp/ociobuild
mkdir /tmp/ociobuild
cd /tmp/ociobuild

#cmake -D CMAKE_INSTALL_PREFIX=/opt/git/libs /usr/src/frustrado/calligra/OpenColorIO && make && make install
cmake -D CMAKE_INSTALL_PREFIX=/usr/local /usr/src/frustrado/calligra/OpenColorIO && make && make install

cp /opt/git/libs/lib/pkgconfig/OpenColorIO.pc /usr/lib/pkgconfig/
