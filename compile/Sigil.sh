#!/bin/bash

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado

DIR=/usr/src/frustrado/sigil

if [ -d $DIR ]; then
	echo "Directory exists - UPDATING"
	cd $DIR
	git pull
else 
	echo "Directory does not exists - CHECKING OUT"
	git clone https://code.google.com/p/sigil/
	cd $DIR
fi



mkdir -p /usr/src/frustrado/sigil_build
cd /usr/src/frustrado/sigil_build

cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release /usr/src/frustrado/sigil
make
make install  DESTDIR="/opt/git/sigil/"

