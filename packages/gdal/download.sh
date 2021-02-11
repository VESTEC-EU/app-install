#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ ! -f gdal-$version.tar.gz ]; then
    wget https://github.com/OSGeo/gdal/releases/download/v$version/gdal-$version.tar.gz
fi
tar -xzf gdal-$version.tar.gz
