#!/bin/bash

#svn co svn://scribus.info/Scribus/trunk

mkdir /usr/src/svn/scribus -p
mkdir /opt/svn/scribus -p
cd /usr/src/svn/scribus
#mkdir ~/src/
#mkdir ~/src/scribus_svn
#sudo mkdir /usr/local/scribus_svn
#cd ~/src/scribus_svn
svn co svn://scribus.info/Scribus/trunk/Scribus
cd ./Scribus
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/svn/scribus
make
make install

