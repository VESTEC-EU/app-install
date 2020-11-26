#!/bin/bash

root=$PWD

# Build TTK
if [ ! -d ipicmini-source ]; then
  git clone https://github.com/pierre-guillou/ipicmini.git ipicmini-source
  mkdir ipicmini-build
  cd ipicmini-source
  git checkout 5feb2e8a90b15b1d2a6519421b0b27067585adef
  cd ..
fi

if [ ! -d ipicmini-build ]; then
  mkdir ipicmini-build
fi

cd ipicmini-build
cmake -DParaView_DIR=$root/paraview-build/install/lib/cmake/paraview-5.8\
      -DUSE_CATALYST=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$root/install/ipicmini/ \
      $root/ipicmini-source/src

make -j8

mkdir $root/install/ipicmini/
mkdir $root/install/ipicmini/bin
mkdir $root/install/ipicmini/lib
cp iPICmini $root/install/ipicmini/bin
cp lib* $root/install/ipicmini/lib

