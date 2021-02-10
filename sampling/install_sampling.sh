#!/bin/bash

root=$PWD

# Build Sampling
if [ ! -d sampling-source ]; then
  git clone https://github.com/Flatken/vestec-sampling.git sampling-source
  mkdir sampling-build
  cd sampling-source
  git checkout feature/robustness
  cd ..
fi

if [ ! -d sampling-build ]; then
  mkdir sampling-build
fi

if [ ! -d eigen-source ]; then
  git clone https://gitlab.com/libeigen/eigen.git eigen-source
  mkdir eigen-build
  cd eigen-source
  git checkout 3.3
  cd ..
fi

if [ ! -d eigen-build ]; then
  mkdir eigen-build
fi

cd eigen-build
cmake -DCMAKE_INSTALL_PREFIX=$root/install/eigen \
      $root/eigen-source

make -j8
make install

cd ..
echo ...
echo Compiling sampling libraries
echo ...

cd sampling-build
cmake -DParaView_DIR=$root/paraview-build/install/lib/cmake/paraview-5.8\
      -DCMAKE_INSTALL_PREFIX=$root/install/sampling \
      -DUSE_CATALYST=ON \
      -DEigen3_DIR=$root/install/eigen\
      -DEXTERNALS_DIR=$root/install/sampling \
      $root/sampling-source

make -j8
make install

