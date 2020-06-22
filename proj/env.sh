if [ -z "$INSTALLER_PROJ_ENV_SH" ]; then
    INSTALLER_PROJ_ENV_SH=1

    export installer_proj_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_proj_dir/../env.sh

    # Open source, install world usable
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export proj_version=6.2.1
    export proj_prefix=$app_dir/proj/$proj_version

    module swap PrgEnv-cray PrgEnv-gnu
    module swap gcc gcc/7.3.0
    module load cmake/3.16.0
    export CRAYPE_LINK_TYPE=dynamic
fi
