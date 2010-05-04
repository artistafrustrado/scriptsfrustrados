#!/bin/bash

cd /usr/src/frustrado
svn checkout https://osxcart.svn.sourceforge.net/svnroot/osxcart/trunk osxcart
cd osxcart
./autogen.sh
