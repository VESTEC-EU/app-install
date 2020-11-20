#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

pushd $build_dir_name
cmake --build . -j $make_parallelism
