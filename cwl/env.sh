if [ -z "$INSTALLER_CWL_ENV_SH" ]; then
    INSTALLER_CWL_ENV_SH=1

    export installer_cwl_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_cwl_dir/../env.sh

    export cwl_version=mpi-req
    export cwl_install_dir=$app_dir/cwl/$cwl_version

    module load python-compute/3.6.0_gcc6.1.0
fi
