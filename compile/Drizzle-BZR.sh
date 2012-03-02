#!/bin/bash

#if [ -f /etc/apt/sources.list.d/ubuntu.list ]
#then
#	echo "Already have ubuntu repos"
#else
#
#echo "Installed ubuntu repos"
#cat >> /etc/apt/sources.list.d/ubuntu.list << EOF
#deb http://ppa.launchpad.net/drizzle-developers/ppa/ubuntu maverick main
#deb-src http://ppa.launchpad.net/drizzle-developers/ppa/ubuntu maverick main
#EOF
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 06899068
#
#fi 


apt-get install autoconf automake bison flex gettext gperf intltool libboost-date-time-dev libboost-dev libboost-filesystem-dev libboost-iostreams-dev libboost-program-options-dev libboost-regex-dev libboost-test-dev libboost-thread-dev libpcre3-dev libreadline-dev libtool protobuf-compiler python-sphinx uuid-dev zlib1g-dev libcurl4-gnutls-dev libgcrypt11-dev libgearman-dev libhaildb-dev libmemcached-dev libpam0g-dev libprotobuf-dev libtokyocabinet-dev libv8-dev systemtap-sdt-dev libnotifymm-dev doxygen pandora-build

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado

bzr branch lp:drizzle
cd drizzle
./config/autorun.sh --prefix=/opt/drizzle
./configure --prefix=/opt/drizzle && make && make install

chown drizzle /opt/drizzle/var/drizzle/ -R

mkdir /opt/drizzle/logs/
chown -R drizzle /opt/drizzle/logs/ 

mkdir /etc/drizzle/
