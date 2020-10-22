#!/bin/bash

# Build Sampling
if [ ! -d sampling-source ]; then
  git clone https://github.com/Flatken/vestec-sampling.git sampling-source
  mkdir sampling-build
  cd sampling-source
  git checkout feature/paraview-5.8
  cd ..
fi

if [ ! -d eigen-source ]; then
  git clone https://gitlab.com/libeigen/eigen.git eigen-source
  mkdir eigen-build
  cd eigen-source
  git checkout 3.3
  cd ..
fi

cd eigen-build
cmake -DCMAKE_INSTALL_PREFIX=/home/d170/d170/flatken/eigen \
      ../eigen-source

make -j8
make install

cd ..
echo ...
echo Compiling sampling libraries
echo ...

cd sampling-build
cmake -DParaView_DIR=/home/d170/d170/flatken/paraview-build/install/lib/cmake/paraview-5.8\
      -DCMAKE_INSTALL_PREFIX=/home/d170/d170/flatken/sampling \
      -DUSE_CATALYST=ON \
      -DEigen3_DIR=/home/d170/d170/flatken/eigen\
      ../sampling-source

make -j8
make install

