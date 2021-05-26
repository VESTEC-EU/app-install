#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ ! -d $source_dir_name ]; then
    if [ ! -f eigen-$version.tar.gz ]; then
	wget https://gitlab.com/libeigen/eigen/-/archive/${version}/eigen-${version}.tar.gz
    fi
    tar -xzf eigen-${version}.tar.gz
fi
