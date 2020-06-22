#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ ! -d $mesonh_prefix ]; then
    if [ ! -f MNH-V5-4-2.tar.gz ]; then
	wget http://mesonh.aero.obs-mip.fr/mesonh/dir_open/dir_MESONH/MNH-V5-4-2.tar.gz
    fi
    mkdir -p $app_dir/mesonh
    cd $app_dir/mesonh
    tar -xzf MNH-V5-4-2.tar.gz
    mv MNH-V5-4-2 5.4.2
fi
