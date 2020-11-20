#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

wget https://github.com/libffi/libffi/releases/download/v3.3/libffi-3.3.tar.gz
tar -xzf libffi-3.3.tar.gz
