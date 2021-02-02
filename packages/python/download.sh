#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))

. $thisdir/env.sh
# OpenSSL module breaks system wget
if module is-loaded openssl; then
    module unload openssl
fi

if [ ! -f Python-$version.tar.xz ]; then
    wget https://www.python.org/ftp/python/$version/Python-$version.tar.xz
fi
tar -xJf Python-$version.tar.xz
cd Python-$version
patch -z .orig -p1 < $thisdir/pybuild.patch
