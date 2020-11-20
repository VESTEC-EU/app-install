#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ -z $source_dir_name ]; then
    exit 1
fi

pushd $source_dir_name

./configure --prefix=$prefix $configure_other_args

