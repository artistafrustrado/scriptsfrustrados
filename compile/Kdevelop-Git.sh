#!/bin/bash

KDD=/usr/src/frustrado

mkdir -p $KDD
cd $KDD

git clone git://anongit.kde.org/kdevplatform $KDD/src/kdevplatform
git clone git://anongit.kde.org/kdevelop $KDD/src/kdevelop

cd $KDD/src/kdevplatform ; git checkout -b 1.2 origin/1.2 
cd $KDD/src/kdevelop ; git checkout -b 4.2 origin/4.2
