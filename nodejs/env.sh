if [ -z "$INSTALLER_NODEJS_ENV_SH" ]; then
    INSTALLER_NODEJS_ENV_SH=1

    export installer_nodejs_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_nodejs_dir/../env.sh

    # Open source, install world usable
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export nodejs_version=12.16.1
    export prefix=$app_dir/nodejs/$nodejs_version
    export source_dir_name=node-v$nodejs_version

    module load python
    module load gcc/6.3.0
    module load openssl

    export CC=gcc
    export configure_other_args="--shared-openssl"
fi
