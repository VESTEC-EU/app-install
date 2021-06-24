#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

# Here we set up a venv and install numpy

# Ensure that if this is the first version installed, others can also
# write the package dir
mkdir_gw $app_dir/$name

python3 -m venv --system-site-packages $prefix
. $prefix/bin/activate

pip3 install numpy
