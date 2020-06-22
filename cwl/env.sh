if [ -z "$INSTALLER_CWL_ENV_SH" ]; then
    INSTALLER_CWL_ENV_SH=1

    export installer_cwl_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_cwl_dir/../env.sh

    # Open source, install world usable
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export cwl_version=master
    export cwl_install_dir=$app_dir/cwl/$cwl_version

    module load python/3.8.3
fi
