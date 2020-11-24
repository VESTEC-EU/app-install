#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

. $conf_file
set -e
set -x

bin_dir=$mesonh_prefix/${ARCH}-${OPTLEVEL}
mkdir -p $bin_dir
pushd $bin_dir

prog_list="MESONH LATLON_TO_XY PREP_IDEAL_CASE PREP_REAL_CASE PREP_PGD PREP_NEST_PGD SPAWNING DIAG PREP_SURFEX ZOOM_PGD SPECTRE MNH2LPDM LFI2CDF"
for prog in $prog_list; do
    ln -s $mesonh_prefix/src/dir_obj$XYZ/MASTER/$prog
done
chmod -R g+w $mesonh_prefix
popd
