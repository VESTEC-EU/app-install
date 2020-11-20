#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

python3 -m venv --system-site-packages $prefix
. $prefix/bin/activate

reqs_file=$thisdir/requirements.txt
if [[ -f $thisdir/requirements.template ]]; then
   cat $thisdir/requirements.template | envsubst > requirements.txt
   reqs_file=requirements.txt
fi

pip3 install -r $reqs_file
chmod -R g+w $prefix
