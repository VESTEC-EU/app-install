#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

pushd $source_dir_name
make install
popd

# Ensure that if this is the first version installed, others can also
# write the package dir
chmod g+w $app_dir/$name
# Then the same, recursively, for the whole prefix tree
chmod -R g+w $prefix
