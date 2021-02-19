#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

pushd $build_dir_name
make install
popd

pushd $prefix/bin

./pip3 install --upgrade pip
ln -s python3 python

# Ensure that if this is the first version installed, others can also
# write the package dir
chmod g+w $app_dir/$name
# Then the same, recursively, for the whole prefix tree
chmod -R g+w $prefix
