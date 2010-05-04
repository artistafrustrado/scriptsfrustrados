#!/bin/bash

apt-get install build-essential autoconf libboost-dev libboost-program-options-dev libboost-regex-dev libtool libgavl-dev libglade2-dev libgdl-1-dev libgtkmm-2.4-dev libxv-dev scons valgrind librsvg2-dev git-core


mkdir -p /usr/src/frustrado/lumiera
cd /usr/src/frustrado/lumiera

# NOBUG
git clone git://git.pipapo.org/nobug
cd nobug
autoreconf -i
mkdir build
cd build
../configure
make
make install

# GDL
git clone git://git.lumiera.org/gdl-package
cd gdl-package
./configure
make
sudo make install

git clone git://git.lumiera.org/LUMIERA
cd LUMIERA
autoreconf -fi
mkdir build
cd build
../configure
make

