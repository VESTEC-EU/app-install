#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

mkdir -p build-$proj_version
pushd build-$proj_version
cmake -DCMAKE_INSTALL_PREFIX=$proj_prefix -DCMAKE_BUILD_TYPE=Release ../proj-$proj_version

popd
