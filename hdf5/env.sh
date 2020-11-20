if [ -z "$INSTALLER_HDF5_ENV_SH" ]; then
    INSTALLER_HDF5_ENV_SH=1

    export installer_hdf5_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_hdf5_dir/../env.sh
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export name=hdf5
    export version=1.10.7
    export prefix=$app_dir/$name/$version

    export source_dir_name=hdf5-$version
    export build_dir_name=build-$version

    module load gcc/6.3.0
    module load cmake/3.17.3
    module load zlib/1.2.11

    declare -A cmake_vars
    cmake_vars[BUILD_TESTING]=OFF
    cmake_vars[HDF5_BUILD_EXAMPLES]=OFF
    cmake_vars[HDF5_ENABLE_Z_LIB_SUPPORT]=ON
fi
