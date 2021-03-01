#!/bin/bash

# Build ParaView
if [ ! -d paraview-source ]; then
  git clone https://gitlab.kitware.com/paraview/paraview-superbuild.git paraview-source
  mkdir paraview-build
  cd paraview-source
  git checkout v5.9.0
  git submodule update --init
  cd ..
fi

if [ ! -d paraview-build ]; then
  mkdir paraview-build
fi

#NOTICE: OSPRAY IS DISABLED

cd paraview-build
cmake -DSUPERBUILD_PROJECT_PARALLELISM=8 \
      -DPARAVIEW_BUILD_EDITION=CATALYST_RENDERING \
      -Dparaview_SOURCE_SELECTION=5.9.0 \
      -DENABLE_python=ON \
      -DENABLE_python3=ON \
      -DENABLE_paraviewweb=ON \
      -DENABLE_osmesa=ON \
      -Dmesa_USE_SWR=OFF \
      -DENABLE_mpi=On \
      -DENABLE_ospray=Off \
      -DUSE_SYSTEM_mpi=On \
      -DENABLE_vtkm=OFF \
      -DCMAKE_INSTALL_PREFIX=../install/paraview-5.9.0 \
      -DCMAKE_INSTALL_RPATH="\$ORIGIN" \
      ../paraview-source

make
make install

# since the superbuild final install will fail, we need to manually copy the lib folder in a way that ipicmini can see it
cp -r paraview-build/install/lib/* install/ipicmini/lib/
