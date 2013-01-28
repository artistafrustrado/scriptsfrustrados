#!/bin/bash

hg clone https://bitbucket.org/cyrille/cauchy
#!/bin/bash

#mkdir -p /usr/src/frustrado/calligra
#cd /usr/src/frustrado/calligra

rm -fr /tmp/cauchybuild
mkdir /tmp/cauchybuild
cd /tmp/cauchybuild

cmake -D CMAKE_INSTALL_PREFIX=/opt/git/libs /usr/src/frustrado/calligra/cauchy  && make && make install
