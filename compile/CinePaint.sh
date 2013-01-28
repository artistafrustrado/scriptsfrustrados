echo ubuntu-cvs.sh - install from CVS source on ubuntu
echo Copyright 10.19.2008 Robin.Rowe@cinepaint.org
echo License BSD
echo INSTRUCTIONS: This script downloads and builds CinePaint from CVS.
echo If you are a member of the CinePaint dev team, you want cvs-dev.sh
echo Expect it to take hours to download and build cinepaint from scratch.
echo Fetching cinepaint from SourceForge CVS...
mkdir cvs
cd cvs
echo Press [Enter] when prompted for CVS password...
cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/cinepaint login
cvs -z3 -d:pserver:anonymous@cinepaint.cvs.sourceforge.net:/cvsroot/cinepaint co cinepaint-project
cd cinepaint-project/cinepaint/
echo Installing build tools and libraries...
echo Enter root password to install apt-get packages...
apt-get install gcc automake g++ libfltk1.1-dev libgtk2.0-dev zlib1g-dev libjpeg62-dev libpng12-dev libtiff4-dev libopenexr-dev libxpm-dev libgutenprint-dev libgutenprintui2-dev liblcms1-dev pkg-config ftgl-dev libxmu-dev libxxf86vm-dev flex python-dev libtool
echo Building cinepaint...
sh autogen.sh
./configure --prefix=/opt/cvs/cinepaint
make
echo Enter root password to install cinepaint...
sudo make install
echo Running cinepaint...
#export LD_LIBRARY_PATH=/usr/lib/local
export LD_LIBRARY_PATH=/opt/cvs/cinepaint
cinepaint
echo Don't forget to add LD_LIBRARY_PATH=/usr/lib/local to your profile...
