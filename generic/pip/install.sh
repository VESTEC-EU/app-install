#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

# Export var assignments for envsubst (before reading env and config)
set -a

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

# Ensure that if this is the first version installed, others can also
# write the package dir
mkdir_gw $app_dir/$name

python3 -m venv --system-site-packages $prefix
. $prefix/bin/activate

reqs_file=$thisdir/requirements.txt
if [[ -f $thisdir/requirements.template ]]; then
   cat $thisdir/requirements.template | envsubst > requirements.txt
   reqs_file=requirements.txt
fi

pip3 install -r $reqs_file

# Make the whole prefix tree group writable
chmod -R g+w $prefix
