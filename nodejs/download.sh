#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

wget https://nodejs.org/dist/v$nodejs_version/node-v$nodejs_version.tar.gz
tar -xzf node-v$nodejs_version.tar.gz
