#!/bin/sh

#apt-get build-dep calligra
#apt-get build-dep koffice

#apt-get install libvc-dev libkactivities-dev libwps-dev libvisio-dev
#apt-get install llvm-3.2-dev clang-3.2 compiler-rt libc++-dev libc++abi-dev llvm-3.2-examples llvm-3.2-doc 

export INCLUDE=$INCLUDE:/opt/git/libs/include
export PATH=/opt/git/libs/bin:$PATH
export LD_LIBRARY_PATH=/opt/git/libs/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/opt/git/libs/lib/pkgconfig:$PKG_CONFIG_PATH

#apt-get install cmake cmake-qt-gui cmake-curses-gui kdelibs5-dev libboost-all-dev apt-file create-resources libeigen3-dev libqca2-dev libexiv2-dev libmarble-dev libmarblewidget11 marble-data marble-plugins liblcms2-dev liblcms2-utils libsqlite3-dev libspnav-dev okular-dev okular-extra-backends libxslt1-dev libdcmtk2-dev libwpd-dev libwpg-dev libpoppler-qt4-dev kdepimlibs5-dev libeigen2-dev libmysqlclient-dev libpq-dev libpqxx3-dev freetds-dev libwxbase2.8-dev glew-utils libglew1.6-dev libgsl0-dev libopenexr-dev libkdcraw-dev libopenjpeg-dev openjpeg-tools libfftw3-dev 
 

#if [ $(cat ~/.gitconfig | grep "anongit.kde.org" ) ]; 
#then
#	echo "Git already configured"
#else
#cat >> ~/.gitconfig << EOF
#[url "git://anongit.kde.org/"]
#    insteadOf = kde:
#[url "ssh://git@git.kde.org/"]
#    pushInsteadOf = kde:
#EOF
#fi

if [ -d /opt/git/calligra/kde4/src/calligra ]
then
	cd /opt/git/calligra/kde4/src/calligra
	git pull
	rm -fr /opt/git/calligra/kde4/build/calligra
	mkdir -p /opt/git/calligra/kde4/build/calligra
	mkdir -p /opt/git/calligra/kde4/inst
else

	mkdir -p /opt/git/calligra/kde4/src/
	cd /opt/git/calligra/kde4/src/
	git clone kde:calligra
	mkdir -p /opt/git/calligra/kde4/build/calligra
	mkdir -p /opt/git/calligra/kde4/inst

fi

cd /opt/git/calligra/kde4/build/calligra
cmake -DCMAKE_INCLUDE_PATH=/opt/git/libs/include -DCMAKE_LIBRARY_PATH=/opt/git/libs/lib -DCMAKE_INSTALL_PREFIX=/opt/git/calligra/kde4/inst /opt/git/calligra/kde4/src/calligra -DCMAKE_BUILD_TYPE=RelWithDebInfo #&& make && make install 
make && make install 

#&& make -j6 && make install
#cmake -DCMAKE_INSTALL_PREFIX=/opt/git/calligra/kde4/inst /opt/git/calligra/kde4/src/calligra -DCMAKE_BUILD_TYPE=RelWithDebInfo && make -j6 && make install

