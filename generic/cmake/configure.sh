#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

source_full_path=$PWD/$source_dir_name

mkdir -p $build_dir_name
pushd $build_dir_name

# default CMake variables
declare -A vars
vars[CMAKE_INSTALL_PREFIX]=$prefix
vars[CMAKE_BUILD_TYPE]=Release

# Copy in any new ones from `cmake_vars` associative array
for vname in "${!cmake_vars[@]}"; do
    vars[$vname]=${cmake_vars[$vname]}
done

# Build command line
cmake_cmd="cmake $source_full_path"
for vname in "${!vars[@]}"; do
    cmake_cmd="$cmake_cmd -D${vname}=${vars[$vname]}"
done

echo $cmake_cmd
exec $cmake_cmd

popd
