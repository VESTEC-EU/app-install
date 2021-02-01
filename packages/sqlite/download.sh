#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ ! -f sqlite-autoconf-3340100.tar.gz ]; then
    wget https://www.sqlite.org/2021/sqlite-autoconf-3340100.tar.gz
fi

tar -xzf sqlite-autoconf-3340100.tar.gz
