#!/bin/bash


apt-get build-dep mypaint

cd /usr/src/frustrado

if [ -d /usr/src/frustrado/mypaint-gtk3 ]
then
	cd mypaint-gtk3
	git checkout gtk3
	git pull
else
	git clone --depth 3 git://gitorious.org/mypaint/mypaint.git mypaint-gtk3
	cd mypaint-gtk3
	git checkout gtk3

fi

scons enable_gtk3=1 prefix=/opt/git/mypaint-gtk3 install

