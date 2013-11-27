#!/bin/bash

cd /usr/src/frustrado/blender 

cd build-blender

#bash ../blender/build_files/build_environment/install_deps.sh --with-all --with-opencollada

#cmake ../blender -DCMAKE_INSTALL_PREFIX=/opt/blender -DWITH_INSTALL_PORTABLE=OFF -DWITH_PLAYER=ON -DOPENEXR_ROOT_DIR=/opt/lib/openexr -DWITH_CYCLES_OSL=ON -DWITH_LLVM=ON -DLLVM_VERSION= -DCYCLES_OSL=/opt/lib/osl -DWITH_OPENCOLLADA=ON  -DWITH_CODEC_FFMPEG=ON -DFFMPEG_LIBRARIES='avformat;avcodec;avutil;avdevice;swscale;rt;theoraenc;theoradec;theora;vorbis;vorbisenc;vorbisfile;ogg;xvidcore;vpx;mp3lame;x264;openjpeg'  -DFFMPEG=/opt/lib/ffmpeg -DWITH_CYCLES_OSL=ON  && make && make install


cmake ../blender -DCMAKE_INSTALL_PREFIX=/opt/git/blender -DWITH_INSTALL_PORTABLE=OFF \
  -DOPENEXR_ROOT_DIR=/opt/lib/openexr \
  -DWITH_CYCLES_OSL=ON \
  -DWITH_LLVM=ON \
  -DLLVM_VERSION= \
  -DCYCLES_OSL=/opt/lib/osl \
  -DWITH_OPENCOLLADA=ON \
  -DWITH_CODEC_FFMPEG=ON \
  -DFFMPEG_LIBRARIES='avformat;avcodec;avutil;avdevice;swscale;rt;theoraenc;theoradec;theora;vorbis;vorbisenc;vorbisfile;ogg;xvidcore;vpx;mp3lame;x264;openjpeg' \
  -DFFMPEG=/opt/lib/ffmpeg 
 

#cmake ../blender -DCMAKE_INSTALL_PREFIX=/opt/blender -DWITH_INSTALL_PORTABLE=OFF && make && make install 

#              -DCMAKE_INSTALL_PREFIX=/opt/blender \
#              -DWITH_INSTALL_PORTABLE=OFF \
#              -DWITH_BUILDINFO=OFF \
#              -DWITH_GAMEENGINE=OFF
