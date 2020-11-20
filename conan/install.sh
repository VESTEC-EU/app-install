#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

python3 -m venv --system-site-packages $prefix
. $prefix/bin/activate

pip3 install conan==$version
chmod -R g+w $prefix
