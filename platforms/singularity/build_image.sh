#!/bin/bash

pkg_name=$1

# Sudo only looks for binaries in a few specified dirs, provide full
# path instead (as GH CI doens't put it in /usr/bin or whatever).
singularity_exe=`which singularity`
sudo $singularity_exe build cwl.sif platforms/singularity/$pkg_name/Singularity

