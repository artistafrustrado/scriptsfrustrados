#!/bin/bash

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado
git clone git://source.winehq.org/git/wine.git wine-git
cd wine-git

apt-get install libfreetype6-dev 

