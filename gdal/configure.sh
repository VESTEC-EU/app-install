#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

pushd gdal-$gdal_version
./configure --prefix=$gdal_prefix --with-proj=$PROJ_DIR --with-pg=no --with-webp=no --with-crypto=no --with-curl=no --with-hdf5=$HDF5_DIR LDFLAGS=-Wl,-rpath=$PROJ_DIR/lib64

popd
