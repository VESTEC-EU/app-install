#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

# Set up the virtual env first
if [ ! -f $prefix/bin/activate ]; then 
    python3 -m venv --system-site-packages $prefix
fi
. $prefix/bin/activate

pip3 install numpy==${numpy_version}

$thisdir/main-configure.sh
