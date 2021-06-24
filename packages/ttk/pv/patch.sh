#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

pv_src=$PWD/$pv_source_dir_name

cd $source_dir_name/paraview/patch

./patch-paraview-${pv_version}.sh $pv_src
