if [ -z "$INSTALLER_GDAL_ENV_SH" ]; then
    INSTALLER_GDAL_ENV_SH=1

    export installer_gdal_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_gdal_dir/../env.sh

    # Open source, install world usable
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export gdal_version=3.1.0
    export gdal_prefix=$app_dir/gdal/$gdal_version

    module swap PrgEnv-cray PrgEnv-gnu
    module swap gcc gcc/7.3.0
    module load cmake/3.16.0
    export proj_version=6.2.1
    module load proj/$proj_version
    module load cray-hdf5/1.10.0.1
    export CRAYPE_LINK_TYPE=dynamic
fi
