#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

#virtualenv --system-site-packages $cwl_install_dir
. $cwl_install_dir/bin/activate

pushd cwltool
pip install .
popd

pushd galaxy/packages
for pkg in util containers tool_util; do
    pushd $pkg
    python setup.py install
    popd
done

popd
