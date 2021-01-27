if [ -z "$INSTALLER_NETCDF_ENV_SH" ]; then
    INSTALLER_NETCDF_ENV_SH=1

    export installer_netcdf_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_netcdf_dir/../../env.sh
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export name=netcdf
    export version=4.7.4
    export prefix=$app_dir/$name/$version

    export source_dir_name=netcdf-c-$version
    export build_dir_name=build-$version

    module load gcc/6.3.0
    module load zlib/1.2.11
    module load hdf5/1.10.7
    export CFLAGS=-I${HDF5_DIR}/include
    export LDFLAGS=-L${HDF5_DIR}/lib
    #configure_other_args="--enable-hdf5=$HDF5_DIR"
fi
