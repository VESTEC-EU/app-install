#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

# Ensure that if this is the first version installed, others can also
# write the package dir
mkdir_gw $app_dir/$name

if [ ! -d $prefix/bin/ ]; then 
    python3 -m venv --system-site-packages $prefix
fi
. $prefix/bin/activate

# GDAL extensions must properly link agains libgdal.so
pip3 install --global-option=build_ext --global-option=-R$GDAL_DIR/lib GDAL==$wfapost_gdal_version

# Rest as normal
pushd wfapost
pip3 install -r requirements.txt .

# Make the whole prefix tree group writable
chmod -R g+w $prefix
