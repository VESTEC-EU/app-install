if [ -z "$INSTALLER_NODEJS_ENV_SH" ]; then
    INSTALLER_NODEJS_ENV_SH=1

    export installer_nodejs_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_nodejs_dir/../env.sh

    # Open source, install world usable
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export nodejs_version=12.16.1
    export nodejs_prefix=$app_dir/nodejs/$nodejs_version

    module swap PrgEnv-cray PrgEnv-gnu
    module load python-compute/2.7.6
    module swap gcc gcc/7.3.0
fi
