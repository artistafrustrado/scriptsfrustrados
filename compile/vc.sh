#!/bin/bash

#git clone --depth=3 git://gitorious.org/vc/vc.git

rm -fr /tmp/vcbuild
mkdir /tmp/vcbuild
cd /tmp/vcbuild

cmake -D CMAKE_INSTALL_PREFIX=/opt/git/libs /usr/src/frustrado/calligra/vc && make && make install
