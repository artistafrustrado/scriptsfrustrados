#!/bin/bash

apt-get install build-essential libgimp2.0-dev libexiv2-dev liblensfun-dev git

cd /usr/src/frustrado

git clone git://github.com/seebk/GIMP-Lensfun.git

cd GIMP-Lensfun
make
