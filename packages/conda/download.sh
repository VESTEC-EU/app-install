#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))

. $thisdir/env.sh

if [ ! -f $installer_name ]; then
    wget https://repo.anaconda.com/miniconda/${installer_name}
fi
