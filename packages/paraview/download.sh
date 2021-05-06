#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ -d $source_dir_name ]; then
    pushd $source_dir_name
    git pull --ff-only origin $version_tag
    git submodule update --init --recursive
    popd
else
    git clone -b $version_tag --recursive https://gitlab.kitware.com/paraview/paraview-superbuild $source_dir_name
fi
