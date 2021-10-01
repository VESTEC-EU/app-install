#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ ! -d $source_dir_name ]; then
    git clone -b $version_tag https://github.com/Flatken/vestec-sampling.git $source_dir_name
fi
