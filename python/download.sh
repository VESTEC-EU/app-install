#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))

# OpenSSL module breaks system wget
#. $thisdir/env.sh

wget https://www.python.org/ftp/python/3.8.5/Python-3.8.5.tar.xz
tar -xJf Python-3.8.5.tar.xz
cd Python-3.8.5
patch -z .orig -p1 < $thisdir/pybuild.patch
