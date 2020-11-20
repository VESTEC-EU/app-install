#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ ! -f node-v$version.tar.gz ]; then
    wget https://nodejs.org/dist/v$version/node-v$version.tar.gz
fi
tar -xzf node-v$version.tar.gz
