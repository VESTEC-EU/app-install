#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ ! -d proj-$version ]; then
    if [ ! -f proj-$version.tar.gz ]; then
	wget https://download.osgeo.org/proj/proj-$version.tar.gz
    fi
    tar -xzf proj-$version.tar.gz
fi
