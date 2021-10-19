#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ -d fireapp ]; then
    pushd fireapp
    git pull --ff-only origin $version
    popd
else
    git clone -b $version https://code.tecnosylva.es/sharing/vestec.git fireapp
fi
