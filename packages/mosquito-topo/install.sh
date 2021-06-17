#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

set -a

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

# Ensure that if this is the first version installed, others can also
# write the package dir
mkdir_gw $app_dir/$name

if [ ! -d $prefix/bin/ ]; then 
    python -m venv --system-site-packages $prefix
fi

. $prefix/bin/activate

venv_sitepackages=$(python -c 'import sysconfig; print(sysconfig.get_path("platlib"))')

# Must install numpy first, to build gdal_array optional package
pip3 install numpy
# GDAL extensions must properly link agains libgdal.so
pip3 install --global-option=build_ext --global-option=-R$GDAL_DIR/lib GDAL==$my_gdal_version

# Rest as normal
pushd $source_dir_name
pip3 install .

# Because pvpython is broken as an interpreter, need a custom runscript
envsubst < $thisdir/fbk_postproc.template > $prefix/bin/fbk_postproc
chmod a+x $prefix/bin/fbk_postproc

# Make the whole prefix tree group writable
chmod -R g+w $prefix
