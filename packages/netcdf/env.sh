if [ -z "$INSTALLER_NETCDF_ENV_SH" ]; then
    INSTALLER_NETCDF_ENV_SH=1
    installer_netcdf_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_netcdf_dir/../../env.sh

    name=netcdf
    version=4.7.4
    visibility=public

    source_dir_name=netcdf-c-$version
    build_dir_name=build-$version

    configure_other_args=""

    installer_init

    export CFLAGS=-I${HDF5_DIR}/include
    export LDFLAGS=-L${HDF5_DIR}/lib
fi
