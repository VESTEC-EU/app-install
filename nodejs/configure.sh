#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

pushd node-v$nodejs_version
./configure --prefix=$nodejs_prefix
patch -p1 < $installer_nodejs_dir/linking.patch

popd
