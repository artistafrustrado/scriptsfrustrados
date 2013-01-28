#!/bin/bash

mkdir -p /usr/src/frustrado

cd /usr/src/frustrado

if [ -d /usr/src/frustrado/semantik ]
then
	cd semantik
	svn update

else
	svn checkout http://semantik.googlecode.com/svn/trunk/ semantik
	cd semantik

fi


./waf configure && ./waf && ./waf install
