#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh
set -x
if [ ! -d $source_dir_name ]; then
    if [ ! -f $version.tar.gz ]; then
	wget https://github.com/topology-tool-kit/ttk/archive/refs/tags/$version.tar.gz
    fi
    tar -xzf $version.tar.gz
fi

if [ ! -f $source_dir_name/paraview/patch/patch-paraview-${pv_version}.sh ]; then
   echo "Don't have suitable patch for paraview ${pv_version}"
   exit 1
fi

if [ ! -d $pv_source_dir_name ]; then
    pv_tarball=ParaView-v$pv_version.tar.gz
    if [ ! -f $pv_tarball ]; then
	IFS='.' read -a semver <<< "$pv_version"
	pv_ver_minor="v${semver[0]}.${semver[1]}"
	wget -O $pv_tarball "https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=${pv_ver_minor}&type=source&os=Sources&downloadFile=ParaView-v$pv_version.tar.gz"
    fi
    tar -xzf $pv_tarball
fi
