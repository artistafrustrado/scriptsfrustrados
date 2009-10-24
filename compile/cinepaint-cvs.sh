echo ubuntu-cvs.sh - install from CVS source on ubuntu
echo Copyright 10.19.2008 Robin.Rowe@cinepaint.org
echo License BSD
echo INSTRUCTIONS: This script downloads and builds CinePaint from CVS.
echo If you are a member of the CinePaint dev team, you want cvs-dev.sh
echo Expect it to take hours to download and build cinepaint from scratch.
echo Fetching cinepaint from SourceForge CVS...
mkdir -p /usr/src/frustrado
cd /usr/src/frustrado
mkdir cvs
cd cvs
echo Press [Enter] when prompted for CVS password...
cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/cinepaint login
cvs -z3 -d:pserver:anonymous@cinepaint.cvs.sourceforge.net:/cvsroot/cinepaint co cinepaint-project
cd cinepaint-project/cinepaint/
echo Installing build tools and libraries...
echo Enter root password to install apt-get packages...
sudo apt-get install gcc automake g++ libfltk1.1-dev libgtk2.0-dev zlib1g-dev libjpeg62-dev libpng12-dev libtiff4-dev libopenexr-dev libxpm-dev libgutenprint-dev libgutenprintui2-dev liblcms1-dev pkg-config ftgl-dev libxmu-dev libxxf86vm-dev flex python-dev libtool
echo Building cinepaint...
sh autogen.sh
./configure --prefix=/opt/cinepaint
make
echo Enter root password to install cinepaint...
make install


cat >> /usr/share/applications/cinepaint-cvs.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Cinepaint - CVS
GenericName=Cinepaint - CVS
Comment=Cinepaint - CVS
Exec=/opt/cinepaint/bin/cinepaint %U
TryExec=/opt/cinepaint/bin/cinepaint
Icon=/opt/cinepaint/share/pixmaps/cinepaint.png
Terminal=false
Categories=Graphics;2DGraphics;RasterGraphics;GTK;
StartupNotify=true
MimeType=application/postscript;application/pdf;image/bmp;image/g3fax;image/gif;image/x-fits;image/pcx;image/x-portable-anymap;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/x-psd;image/x-sgi;image/x-tga;image/x-xbitmap;image/x-xwindowdump;image/x-xcf;image/x-compressed-xcf;image/tiff;image/jpeg;image/x-psd;image/png;image/x-icon;image/x-xpixmap;image/svg+xml;image/x-wmf;
EOF

killall -9 gnome-panel

echo Running cinepaint...
#export LD_LIBRARY_PATH=/usr/lib/local
/opt/cinepaint/bin/cinepaint
#echo Don't forget to add LD_LIBRARY_PATH=/usr/lib/local to your profile...
