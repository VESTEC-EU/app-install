#!/bin/bash

# Build TTK
if [ ! -d ipicmini-source ]; then
  git clone https://github.com/pierre-guillou/ipicmini.git ipicmini-source
  mkdir ipicmini-build
  cd ipicmini-source
  git checkout 5feb2e8a90b15b1d2a6519421b0b27067585adef
  cd ..
fi

cd ipicmini-build
cmake -DParaView_DIR=/home/d170/d170/flatken/paraview-build/install/lib/cmake/paraview-5.8\
      -DUSE_CATALYST=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/home/d170/d170/flatken/ipicmini/ \
      ../ipicmini-source/src

make -j8

mkdir /work/d170/d170/flatken/ipicmini/
mkdir /work/d170/d170/flatken/ipicmini/bin
mkdir /work/d170/d170/flatken/ipicmini/lib
cp iPICmini /work/d170/d170/flatken/ipicmini/bin
cp lib* /work/d170/d170/flatken/ipicmini/lib

