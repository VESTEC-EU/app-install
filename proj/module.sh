#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh
mkdir -p $mod_dir/proj

cat $installer_proj_dir/modtemplate.tcl | envsubst > $mod_dir/proj/$proj_version
