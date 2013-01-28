#!/bin/bash

apt-get install build-essential perl python git

apt-get install ^libxcb.* libx11-xcb-dev libglu1-mesa-dev libxrender-dev

apt-get install libedit-dev

apt-get install flex bison gperf libicu-dev

mkdir -p /opt/git/qt
cd /opt/git/qt

git clone git://gitorious.org/qt/qt5.git qt5

cd qt5
perl init-repository

unset QTDIR
export PATH="$PWD/qtbase/bin:$PWD/qtrepotools/bin:$PATH"

#./configure -developer-build -opensource -nomake examples -nomake tests
./configure -developer-build -opensource -confirm-license

./build -j3 
