#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

wget -O hdf5-$version.tar.gz 'https://www.hdfgroup.org/package/hdf5-1-10-7-tar-gz/?wpdmdl=15050&refresh=5fb7ea8c23ee11605888652'
tar -xzf hdf5-$version.tar.gz
