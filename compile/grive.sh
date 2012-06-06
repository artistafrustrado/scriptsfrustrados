#!/bin/bash

git clone https://github.com/match065/grive.git

apt-get install libjson0-dev libcurl4-openssl-dev libstdc++6-4.7-dev libssl-dev openssl libboost-all-dev libcppunit-dev libcunit1-dev libcppunit-subunit-dev cxxtest libcunit1 libcppunit-doc binutils-dev 

mkdir grive-build
cd grive-build
cmake ../grive && make && make install
