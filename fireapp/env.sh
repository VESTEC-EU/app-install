if [ -z "$INSTALLER_FIREAPP_ENV_SH" ]; then
    INSTALLER_FIREAPP_ENV_SH=1

    export installer_fireapp_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_fireapp_dir/../env.sh

    # Closed source, keep VESTEC only
    export app_dir=$priv_app_dir
    export mod_dir=$priv_mod_dir

    export fireapp_version=separate-TUs
    export fireapp_prefix=$app_dir/fireapp/$fireapp_version

    module swap PrgEnv-cray PrgEnv-gnu
    module swap gcc gcc/7.3.0
    module load cmake/3.16.0
    module load cray-hdf5/1.10.0.1
    unset HDF5_ROOT
    module load cray-netcdf/4.4.1.1
    export gdal_version=3.1.0
    module load gdal/$gdal_version
    export CRAYPE_LINK_TYPE=dynamic
fi
