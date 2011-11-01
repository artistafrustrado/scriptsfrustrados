#!/bin/bash


apt-get build-dep mypaint

cd /usr/src/frustrado
#git clone git://gitorious.org/mypaint/mypaint.git
cd mypaint
scons prefix=/opt/git/mypaint install

