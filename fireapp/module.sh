#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh
mkdir -p $mod_dir/fireapp

cat $installer_fireapp_dir/modtemplate.tcl | envsubst > $mod_dir/fireapp/$fireapp_version
