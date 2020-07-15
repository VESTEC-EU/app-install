#!/bin/bash

# Build WFA
if [ ! -d wfa-source ]; then
  git clone https://git.firesponse.es/external/vestec.git wfa-source
  cd wfa-source
  git checkout 8fce0a845836968e2658a8c64c58f39fba77c652
  cd ..
  mkdir wfa-build
fi

cd wfa-build
cmake -DUSE_CATALYST=ON \
      -DCMAKE_INSTALL_PREFIX=/home/d170/d170/shared/sw/fireapp/catalyst \
      -DCMAKE_INSTALL_RPATH="\$ORIGIN/../lib:/home/d170/shared/sw/paraview/5.8.1-RC1/lib:/home/d170/shared/sw/gdal/3.1.0/lib" \
      -DGDAL_CONFIG=/home/d170/shared/sw/gdal/3.1.0/bin/gdal-config \
      -DGDAL_INCLUDE_DIR=/home/d170/shared/sw/gdal/3.1.0/include \
      -DParaView_DIR=/work/d170/d170/mmigl/paraview-build/install/lib/cmake/paraview-5.8 \
      ../wfa-source

make -j8
make install

