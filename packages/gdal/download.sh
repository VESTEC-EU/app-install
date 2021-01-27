#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

wget https://github.com/OSGeo/gdal/releases/download/v$version/gdal-$version.tar.gz
tar -xzf gdal-$version.tar.gz
