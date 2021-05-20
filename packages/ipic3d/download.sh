#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ ! -d ipic3d-klm ]; then
    git clone https://bitbucket.org/bopkth/ipic3d-klm.git
fi
