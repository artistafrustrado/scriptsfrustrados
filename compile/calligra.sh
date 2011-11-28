#!/bin/sh

# Just change where it says off / on below to pick what parts of Calligra suite you would like built. Note: The more you choose the longer it takes!

make_words=off
make_tables=off
make_stage=off
make_kthesaurus=off

make_kexi=off
make_plan=off
make_flow=off
make_braindump=off

make_krita=on
make_karbon=on

make_koconverter=off

LANG=C
_gittrunk=http://anongit.kde.org/calligra/calligra-latest.tar.gz
_gitdir=calligra
_startdir=`pwd`
_cbversion=0.8.4

echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "              _"
echo "           ,d88P'              ,8     op   ,o."
echo "        ,o8P                  d8'   ,8P     Y8"
echo "      ,d8P'                  d8'   ,8F        ="
echo "     d8P'           _u,     ,8'    dP    _,      ___ _   __           ._."
echo "    88           ,o8P  P   ,8[    dP     88    d88 888  ]8L,ooo._  od8P8Y"
echo "   88          ,d8 ,,oop   d8    ,8[    d8P  ,8P _o88[  88P      d8P _ooo."
echo "   88         d88odP Y8b  ,8[   ,8P   ,=8P  ,88o8P dP  d8F     _88boP  88"
echo "   Y8b.._._,o=PPP      P=P78boP  8bopP YP    PP^^ d8  ,8P       PP^^    YPY"
echo "     ^^^^^^^                ^^    ^^             d88"
echo "                                                d8P"
echo "                                           /   d8 "
echo "                                          b _o8P"
echo "                                          ^^^"
echo ""
echo "              Builder version "$_cbversion"  Herding cats... please wait."
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""


if [ -d ./$_gitdir ]; then
    (cd ./$_gitdir/$_gitdir-src && git pull)
else
 if [ -f ./calligra-latest.tar.gz ]; then
(echo "Extracting source..." && tar -xzf calligra-latest.tar.gz && echo "Renaming source folder..." && mv ./calligra ./$_gitdir-src && echo "Creating base folder..." && mkdir ./$_gitdir && echo "Moving source into sub-folder..." && mv ./$_gitdir-src ./$_gitdir/ && echo "Initialising repository..." && cd ./$_gitdir/$_gitdir-src && ./initrepo.sh && cd ./.git && git remote set-url origin git://anongit.kde.org/calligra && echo "Making build and install directories..." && mkdir -p $_startdir/$_gitdir/$_gitdir-inst && mkdir -p $_startdir/$_gitdir/$_gitdir-build)
 else
(echo "Downloading Calligra source code (may take a while!)" && wget $_gittrunk && echo "Extracting source..." && tar -xzf calligra-latest.tar.gz && echo "Renaming source folder..." && mv ./calligra ./$_gitdir-src && echo "Creating base folder..." && mkdir ./$_gitdir && echo "Moving source into sub-folder..." && mv ./$_gitdir-src ./$_gitdir/ && echo "Initialising repository..." && cd ./$_gitdir/$_gitdir-src && ./initrepo.sh && cd ./.git && git remote set-url origin git://anongit.kde.org/calligra && echo "Making build and install directories..." && mkdir -p $_startdir/$_gitdir/$_gitdir-inst && mkdir -p $_startdir/$_gitdir/$_gitdir-build)
 fi
fi
echo "Setting up environment"
cd $_startdir/$_gitdir/$_gitdir-inst      #set up your variables so Calligra will find it's libraries when you run it
export KDEDIRS=$(kde4-config --prefix)
export KDEDIRS=$KDEDIRS:`pwd`
export KDEDIR=$KDEDIRS
export PATH=$PATH:`pwd`/bin
export XDG_DATA_DIRS=$XDG_DATA_DIRS:`pwd`/share
export XDG_DATA_HOME=$XDG_DATA_HOME:`pwd`/share
kbuildsycoca4



cd $_startdir/$_gitdir/$_gitdir-src

echo ""
echo ""
echo ""
echo ""
echo ""
echo "Now witness the magic of open source as you build your very own copy of Calligra..."

calligra_version=`git describe --tags`

cd ../$_gitdir-build

cmake ../$_gitdir-src -DBUILD_words=$make_words -DBUILD_tables=$make_tables -DBUILD_stage=$make_stage  -DBUILD_kthesaurus=$make_kthesaurus -DBUILD_kexi=$make_kexi  -DBUILD_plan=$make_plan -DBUILD_flow=$make_flow -DBUILD_braindump=$make_braindump -DBUILD_krita=$make_krita -DBUILD_karbon=$make_karbon -DBUILD_koconverter=$make_koconverter -DCMAKE_INSTALL_PREFIX=../$_gitdir-inst -DBUILD_cstester=OFF -DBUILD_koabstraction=OFF -DBUILD_f-office=OFF -DCMAKE_BUILD_TYPE=RELWITHDEBINFO

echo "Quick! To the Batmobile!"
make -j$((`cat /proc/cpuinfo | grep processor | wc -l`+1))  #make with your number of cores+1
echo "Atomic batteries to power..."
make install -j$((`cat /proc/cpuinfo | grep processor | wc -l`+1))  #installwith your number of cores+1
echo "Turbines to speed..."
echo ""
kbuildsycoca4
echo ""
echo ""
echo "Let's go!!!!"
cd ../$_gitdir-inst/bin
echo "If you see the names of Calligra apps below (rather than a bunch of stuff like cMake files) you've succsessfully built (either now or in the past) the following apps:"
ls
echo ""
echo "Version:";
echo $calligra_version
echo "(Format is: Version number - revisions since the version number - git hash)"
echo ""
echo "Now, just type ./"$_gitdir"/"$_gitdir"-inst/bin/  and then the name of the app you want to run (eg cd ./"$_gitdir"/"$_gitdir"-inst/bin/krita to run Krita)"
