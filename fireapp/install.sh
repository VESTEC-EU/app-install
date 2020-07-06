#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

pushd build-$fireapp_version
make install

# CMake RPATH handling is going wrong
for exe in WildFire; do
    cp bin/$exe $fireapp_prefix/bin/
done

popd
