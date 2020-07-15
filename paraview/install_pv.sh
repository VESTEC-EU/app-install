#!/bin/bash

# Build ParaView
if [ ! -d paraview-source ]; then
  git clone https://gitlab.kitware.com/paraview/paraview-superbuild.git paraview-source
  mkdir paraview-build
  cd paraview-source
  git checkout e9736b30ce3e50217e113080d1eeedf504c764b1
  git submodule update --init
  cd ..
fi

cd paraview-build
cmake -DSUPERBUILD_PROJECT_PARALLELISM=8 \
      -DPARAVIEW_BUILD_EDITION=CATALYST_RENDERING \
      -Dparaview_SOURCE_SELECTION=5.8.1-RC1 \
      -DENABLE_python=ON \
      -DENABLE_python3=ON \
      -DENABLE_paraviewweb=ON \
      -DENABLE_osmesa=ON \
      -Dmesa_USE_SWR=OFF \
      -DENABLE_ospray=ON \
      -DCMAKE_INSTALL_PREFIX=/home/d170/shared/sw/paraview/5.8.1-RC1 \
      -DCMAKE_INSTALL_RPATH="\$ORIGIN" \
      ../paraview-source

make
make install

