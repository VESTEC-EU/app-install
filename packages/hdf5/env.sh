if [ -z "$INSTALLER_HDF5_ENV_SH" ]; then
    INSTALLER_HDF5_ENV_SH=1
    installer_hdf5_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_hdf5_dir/../../env.sh

    name=hdf5
    version=1.10.7
    visibility=public

    source_dir_name=hdf5-$version
    build_dir_name=build-$version

    installer_init

    configure_other_args="--disable-tests --with-zlib=$(pkg-config --variable=prefix zlib)"
fi
