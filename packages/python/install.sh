#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

# Ensure that if this is the first version installed, others can also
# write the package dir
mkdir_gw $app_dir/$name

pushd $build_dir_name
make install
popd

pushd $prefix/bin

./pip3 install --upgrade pip
ln -s python3 python

# Make the whole prefix tree group writable
chmod -R g+w $prefix
