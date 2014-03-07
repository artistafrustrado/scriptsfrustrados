#!/bin/bash

#hg clone https://bitbucket.org/opengtl/opengtl/

hg clone https://bitbucket.org/opengtl/opengtl
hg clone https://bitbucket.org/opengtl/gtldesigner
hg clone https://bitbucket.org/opengtl/libqtgtl
hg clone https://bitbucket.org/opengtl/shiva-collections

alias llvm-config="/usr/bin/llvm-config-3.5"

export INCLUDE=$INCLUDE:/opt/git/libs/include
export PATH=/opt/git/libs/bin:$PATH
export LD_LIBRARY_PATH=/opt/git/libs/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/opt/git/libs/lib/pkgconfig:$PKG_CONFIG_PATH


#rm -fr /tmp/opengtl-build
#mkdir -p /tmp/opengtl-build
#cd /tmp/opengtl-build

# ln -s /usr/bin/llvm-config-3.1 /usr/bin/llvm-config
#cmake -DCMAKE_INSTALL_PREFIX=/opt/git/libs/ /usr/src/frustrado/calligra/opengtl && make && make install

clone_and_compile()
{

	cd /usr/src/frustrado/calligra

        DIR=$1
        PARAMS=$2
        COMMAND=$3
        echo "Installing $DIR"
	
	#hg clone https://bitbucket.org/opengtl/$DIR
#	hg clone https://bitbucket.org/opengtl/$DIR

	rm -fr /tmp/$DIR-build
	mkdir -p /tmp/$DIR-build
	cd /tmp/$DIR-build

	echo cmake -DCMAKE_INCLUDE_PATH=/opt/git/libs/include -DCMAKE_LIBRARY_PATH=/opt/git/libs/lib -DCMAKE_INSTALL_PREFIX=/opt/git/libs/ /usr/src/frustrado/calligra/$DIR && make && make install
	cmake -DCMAKE_INCLUDE_PATH=/opt/git/libs/include -DCMAKE_LIBRARY_PATH=/opt/git/libs/lib -DCMAKE_INSTALL_PREFIX=/opt/git/libs/ /usr/src/frustrado/calligra/$DIR && make && make install
	cp /opt/git/libs/lib/pkgconfig/*.pc /usr/lib/pkgconfig/

}

mkdir -p /usr/src/frustrado/calligra
clone_and_compile opengtl "" ""
clone_and_compile libqtgtl "" ""



