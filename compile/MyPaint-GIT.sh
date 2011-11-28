#!/bin/bash


apt-get build-dep mypaint

cd /usr/src/frustrado

if [ -d /usr/src/frustrado/mypaint ]
then
	cd mypaint
	git pull
else
	git clone git://gitorious.org/mypaint/mypaint.git
cd mypaint
fi

scons prefix=/opt/git/mypaint install

