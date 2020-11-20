#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

wget https://github.com/openssl/openssl/archive/OpenSSL_1_1_1d.tar.gz
tar -xzf OpenSSL_1_1_1d.tar.gz
