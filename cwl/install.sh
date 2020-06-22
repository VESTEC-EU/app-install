#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

python3 -m venv --system-site-packages $cwl_install_dir
#virtualenv --system-site-packages $cwl_install_dir
. $cwl_install_dir/bin/activate

pushd galaxy/packages
for pkg in util containers tool_util; do
    pushd $pkg
    python3 setup.py install
    popd
done
popd

pushd cwltool
pip3 install .
popd
