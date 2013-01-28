#!/bin/bash

apt-get install libfuse-dev libcurl4-gnutls-dev libjson0-dev libxml2-dev libxml++2.6-dev

#git clone https://github.com/jcline/fuse-google-drive.git

cd fuse-google-drive

./autogen.sh && ./configure && make && make install
