#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

python_build=pyenv/plugins/python-build/bin/python-build

TMPDIR=$PWD MAKEOPTS="-j 2" $python_build -k -p $python_version $python_prefix < $thisdir/ffi.patch

$python_prefix/bin/pip3 install --upgrade pip

chmod -R a-w $python_prefix
