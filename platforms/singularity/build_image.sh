#!/bin/bash
thisdir=$(readlink -f $(dirname $BASH_SOURCE))

pkg_name=$1

# Sudo only looks for binaries in a few specified dirs, provide full
# path instead (as GH CI doens't put it in /usr/bin or whatever).
singularity_exe=`which singularity`

cd $thisdir/$pkg_name

sudo $singularity_exe build cwl.sif Singularity

