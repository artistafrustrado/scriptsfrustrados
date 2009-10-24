#!/bin/bash

co_compile_install()
{
        DIR=$1
        PARAMS=$2
        COMMAND=$3
        # bash check if directory exists
        if [ -d $DIR ]; then
                echo "Directory exists - UPDATING"
                cd $DIR
                #svn update
                git pull
        else
                echo "Directory does not exists - CHECKING OUT"
                git clone git://git.debian.org/sane/$DIR.git
                cd $DIR
        fi

        if [ -n $COMMAND ]
        then
                eval $COMMAND
        fi

        ./autogen.sh
        pwd
	./configure --sysconfdir=/etc --prefix=/usr && make && make install
        cd ..
}

apt-get install libusb++-dev  libusb-dev

mkdir -p /usr/src/frustrado
cd /usr/src/frustrado

co_compile_install sane-backends

sed -r 's#echo 1.0.21#echo 1.1.0#g' -i /usr/bin/sane-config 

co_compile_install sane-frontends 

#wget ftp://ftp.sane-project.org/pub/sane/xsane/xsane-0.996.tar.gz 
tar -zxvf xsane-0.996.tar.gz
cd xsane-0.996

rm -f /tmp/xsane-back-gtk.h.diff
cat >> /tmp/xsane-back-gtk.h.diff << EOF
55a56
> #define SANE_CAP_ALWAYS_SETTABLE 7
EOF
patch src/xsane-back-gtk.h /tmp/xsane-back-gtk.h.diff 
rm -f /tmp/xsane-back-gtk.h.diff

./configure --sysconfdir=/etc --prefix=/usr && make && make install
