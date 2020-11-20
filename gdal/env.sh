if [ -z "$INSTALLER_GDAL_ENV_SH" ]; then
    INSTALLER_GDAL_ENV_SH=1

    export installer_gdal_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_gdal_dir/../env.sh

    # Open source, install world usable
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export name=gdal
    export version=3.1.0
    export prefix=$app_dir/$name/$version

    source_dir_name=gdal-$version

    module load gcc/6.3.0
    module load cmake/3.17.3
    module load proj/6.2.1
    module load hdf5/1.10.7

    configure_other_args="--with-proj=$PROJ_DIR --with-pg=no --with-webp=no --with-crypto=no --with-curl=no --with-hdf5=$HDF5_DIR --with-jasper=no"
    #LDFLAGS=-Wl,-rpath=$PROJ_DIR/lib
fi
