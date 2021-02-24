#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ ! -d $prefix ]; then
    if [ ! -f MNH-V${version_dashed}.tar.gz ]; then
	wget http://mesonh.aero.obs-mip.fr/mesonh/dir_open/dir_MESONH/MNH-V${version_dashed}.tar.gz
    fi
    mkdir -p $app_dir/mesonh
    tar -xzf MNH-V${version_dashed}.tar.gz
    mv MNH-V${version_dashed} $app_dir/mesonh/$version
    pushd $prefix
    patch -p1 < $thisdir/config.patch
    patch -p1 < $thisdir/gfortran-rules.patch

    # if version less than or equal to 5.4.4
    if [ $(printf '%s\n' 5.4.4 "$version" | sort -V | head -n1) = "$version" ]; then
	patch -p1 < $thisdir/uninitialised-bug-5.4.4.patch
    fi
    popd
fi
