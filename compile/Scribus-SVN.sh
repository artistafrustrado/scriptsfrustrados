#!/bin/bash


apt-get build-dep scribus-ng
apt-get install gcc g++ cmake subversion ghostscript qt-devel pkg-config lcms-devel libjpeg-devel libtiff-devel libart_lgpl-devel cups-devel libxml2 and libxml2-devel libxml2 python-devel fontconfig-devel openssl-devel freetype freetype-devel python-imaging-devel tk tkinter cairo acairo-devel qt4 qt4-devel qt4-qmake 

mkdir /usr/src/frustrado/scribus -p
mkdir /opt/svn/scribus -p
cd /usr/src/frustrado/scribus

DIR="Scribus"

if [ -d $DIR ]; then
	echo "Directory exists - UPDATING"
	cd $DIR
	svn update
else 
	echo "Directory does not exists - CHECKING OUT"
#	svn co svn://scribus.info/Scribus/trunk/Scribus
	svn co svn://scribus.net/trunk/Scribus
	cd $DIR
fi
echo "COMPILING"
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/svn/scribus
make
make install

cat > /usr/share/applications/scribus-svn.desktop << EOF
[Desktop Entry]
Type=Application
Name=ScribusSVN
Comment=Graphic Page Layout and Publication (SVN)
Exec=/opt/svn/scribus/bin/scribus %f
Icon=scribus-ng
Terminal=false
MimeType=application/vnd.scribus-ng;
Categories=Qt;Publishing;Graphics;
StartupWMClass=scribus-ng
X-AppInstall-Package=scribus-ng
X-AppInstall-Section=main
StartupNotify=false
X-KDE-SubstituteUID=false
X-KDE-Username=
[X-Property::X-KDE-NativeExtension]
Type=QString
Value=.sla
EOF

cat > /usr/local/bin/scribus-svn <<EOF
#!/bin/bash
cd /opt/svn/scribus/bin/
./scribus $1 $2 $3 $4 $5 $6
EOF

chmod a+x /usr/local/bin/scribus-svn
