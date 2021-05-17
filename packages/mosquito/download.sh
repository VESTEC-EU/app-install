#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

tag_regex='[0-9].[0-9].[0-9]'
if [[ $version =~ $tag_regex ]]; then
    # tagged version
    ref=v$version
else
    # branch version
    ref=$version
fi

if [ -d $source_dir_name ]; then
    # Update
    pushd $source_dir_name
    git fetch -p
    if [[ $version =~ $tag_regex ]]; then
	git checkout $ref
    else
	git pull --ff-only origin $ref
    fi
    popd
else
    # Clone afresh
    git clone git@github.com:VESTEC-EU/use-case-mosquito.git $source_dir_name
    pushd $source_dir_name
    git checkout $ref
fi
