#!/bin/bash

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado

git clone git://github.com/Dieterbe/uzbl.git

cd uzbl
make
make install

