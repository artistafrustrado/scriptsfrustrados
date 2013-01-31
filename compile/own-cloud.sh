#!/bin/bash

wget http://download.opensuse.org/repositories/isv:ownCloud:devel/Debian_6.0/Release.key
apt-key add - < Release.key 

echo 'deb http://download.opensuse.org/repositories/isv:ownCloud:devel/Debian_6.0/ /' >> /etc/apt/sources.list.d/owncloud-client.list 
apt-get update
apt-get install owncloud-client
