#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

git clone git@github.com:VESTEC-EU/use-case-mosquito.git
pushd $source_dir_name
git checkout $version
