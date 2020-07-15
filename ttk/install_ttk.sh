#!/bin/bash

# Build TTK
if [ ! -d ttk-source ]; then
  git clone https://github.com/topology-tool-kit/ttk.git ttk-source
  mkdir ttk-build
  cd ttk-source
  git checkout a26adce85a53a7581dfd4fc7bef96305db8a9383
  rm -rf paraview/WRLExporter/ core/vtk/ttkWRLExporter/ 
  cd ..
fi

cd ttk-build
cmake -DParaView_DIR=/work/d170/d170/mmigl/paraview-build/install/lib/cmake/paraview-5.8 \
      -DTTK_ENABLE_KAMIKAZE=ON \
      -DTTK_INSTALL_PLUGIN_DIR=/home/d170/shared/sw/paraview/5.8.1-RC1/lib/paraview-5.8/plugins \
      -DTTK_BUILD_STANDALONE_APPS=OFF \
      -DVTK_MODULE_ENABLE_ttkCinemaImaging=DONT_WANT \
      -DVTK_MODULE_ENABLE_ttkUserInterfaceBase=DONT_WANT \
      -DCMAKE_INSTALL_PREFIX=/home/d170/shared/sw/ttk/dev \
      -DCMAKE_INSTALL_RPATH="\$ORIGIN:/home/d170/shared/sw/ttk/dev/lib/ttk:/home/d170/shared/sw/paraview/5.8.1-RC1/lib:/work/y07/y07/cse/boost/1.60_MPI/GNU/boost/lib" \
      ../ttk-source

make -j8
make install

