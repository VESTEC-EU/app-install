if [ -z "$INSTALLER_CONDA_ENV_SH" ]; then
    INSTALLER_CONDA_ENV_SH=1
    installer_conda_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_conda_dir/../../env.sh

    name=conda
    version=4.9.2
    visibility=public

    installer_name=Miniconda3-py39_${version}-Linux-x86_64.sh

    installer_init
fi
