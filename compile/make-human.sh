#!/bin/bash


#apt-get build-dep mypaint
apt-get install build-essential python2.6-dev libsdl1.2-dev libsdl-image1.2 scons

cd /usr/src/frustrado
#
if [ -d /usr/src/frustrado/makehuman ]
then
	cd makehuman
	svn checkout
else
	svn checkout http://makehuman.googlecode.com/svn/trunk/ makehuman
cd makehuman
fi

scons prefix=/opt/git/mypaint install


