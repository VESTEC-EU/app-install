#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

python3 -m venv --system-site-packages $wfapost_install_dir
. $wfapost_install_dir/bin/activate

# GDAL extensions must properly link agains libgdal.so
pip3 install --global-option=build_ext --global-option=-R$GDAL_DIR/lib GDAL==$wfapost_gdal_version

# Rest as normal
pushd wfapost
pip3 install -r requirements.txt .
