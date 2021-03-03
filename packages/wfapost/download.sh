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
else
    git clone git@github.com:VESTEC-EU/wfapost.git
    pushd wfapost
fi
git checkout $git_ref
popd

