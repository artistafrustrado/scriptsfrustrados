#!/bin/bash


#cd /usr/src/frustrado
mkdir -p /opt/java/arbaro 

cd /opt/java/arbaro 

wget http://ufpr.dl.sourceforge.net/project/arbaro/arbaro/1.9.8/arbaro_1_9_8.zip

unzip arbaro_1_9_8.zip

cat > /usr/local/bin/arbaro <<EOS
#!/bin/bash

cd /opt/java/arbaro
java -jar arbaro.jar

EOS

chmod a+x /usr/local/bin/arbaro
