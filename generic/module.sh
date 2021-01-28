#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

# Export var assignments for envsubst (before reading env and config)
set -a

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

# Look for a template
if [ -f $package_platform_dir/modtemplate.tcl ]; then
    template=$package_platform_dir/modtemplate.tcl
elif [ -f $thisdir/modtemplate.tcl ]; then
    template=$thisdir/modtemplate.tcl
else
    echo "No module template"
    exit 1
fi

mkdir -p $mod_dir/$name

cat $template | envsubst > $mod_dir/$name/$version

chmod -R g+w $mod_dir/$name
