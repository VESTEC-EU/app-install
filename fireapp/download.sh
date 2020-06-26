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
    git pull --all --ff-only origin $fireapp_version
    popd
else
    git clone -b $fireapp_version https://git.firesponse.es/external/vestec.git fireapp
fi
