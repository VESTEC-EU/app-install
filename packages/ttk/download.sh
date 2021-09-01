#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh
set -x
if [ ! -d $source_dir_name ]; then
    if [ ! -f $version.tar.gz ]; then
	wget https://github.com/topology-tool-kit/ttk/archive/refs/tags/$version.tar.gz
    fi
    tar -xzf $version.tar.gz
fi
