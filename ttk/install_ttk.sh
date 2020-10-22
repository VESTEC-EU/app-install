#!/bin/bash

# Build TTK
if [ ! -d ttk-source ]; then
  git clone https://github.com/topology-tool-kit/ttk.git ttk-source
  mkdir ttk-build
  cd ttk-source
  #git checkout a26adce85a53a7581dfd4fc7bef96305db8a9383
  git checkout 265f613646bda66e1b43f2a300dfa100b255c466
  rm -rf paraview/WRLExporter/ core/vtk/ttkWRLExporter/ 
  cd ..
fi

cd ttk-build
cmake -DParaView_DIR=/home/d170/d170/flatken/paraview-build/install/lib/cmake/paraview-5.8\
      -DTTK_ENABLE_KAMIKAZE=ON \
      -DTTK_INSTALL_PLUGIN_DIR=/home/d170/d170/flatken/paraview-5.8.1/lib/paraview-5.8/plugins \
      -DTTK_BUILD_STANDALONE_APPS=OFF \
      -DVTK_MODULE_ENABLE_ttkCinemaImaging=DONT_WANT \
      -DVTK_MODULE_ENABLE_ttkUserInterfaceBase=DONT_WANT \
      -DCMAKE_INSTALL_PREFIX=/home/d170/d170/flatken/ttk/ \
      ../ttk-source

make -j8
make install

