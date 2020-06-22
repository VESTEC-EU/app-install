if [ -z "$INSTALLER_PYTHON_ENV_SH" ]; then
    INSTALLER_PYTHON_ENV_SH=1

    export installer_python_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_python_dir/../env.sh

    # Open source, install world usable
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export python_version=3.8.3
    export python_prefix=$app_dir/python/$python_version

    module swap PrgEnv-cray PrgEnv-gnu
    module load gcc/6.3.0
    module load libffi
fi
