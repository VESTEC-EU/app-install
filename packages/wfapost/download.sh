#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

if [ -d wfapost ]; then
    pushd wfapost
    git fetch
    git checkout $git_ref
else
    git clone git@github.com:VESTEC-EU/wfapost.git
    git checkout $version
fi

