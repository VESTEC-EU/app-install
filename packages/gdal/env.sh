if [ -z "$INSTALLER_GDAL_ENV_SH" ]; then
    INSTALLER_GDAL_ENV_SH=1
    installer_gdal_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_gdal_dir/../../env.sh

    name=gdal
    version=3.1.0
    visibility=public

    source_dir_name=gdal-$version

    installer_init

    configure_other_args="--with-proj=$PROJ_DIR --with-pg=no --with-webp=no --with-crypto=no --with-curl=no --with-hdf5=$HDF5_DIR --with-jasper=no LDFLAGS=-Wl,-rpath=$PROJ_DIR/lib64"
    if [ ! -z "$SQLITE_DIR" ]; then
	configure_other_args="$configure_other_args --with-sqlite3=$SQLITE_DIR --with-proj-extra-lib-for-test=-L$SQLITE_DIR/lib"
    fi
fi
