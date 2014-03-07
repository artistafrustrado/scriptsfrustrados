#!/bin/bash

mkdir -p /usr/src/frustrado/calligra
cd /usr/src/frustrado/calligra

git clone --depth=3 git://gitorious.org/vc/vc.git

rm -fr /tmp/vcbuild
mkdir /tmp/vcbuild
cd /tmp/vcbuild

#cmake -D CMAKE_INSTALL_PREFIX=/opt/git/libs /usr/src/frustrado/calligra/vc && make && make install
cmake -D CMAKE_INSTALL_PREFIX=/usr/local /usr/src/frustrado/calligra/vc && make && make install
