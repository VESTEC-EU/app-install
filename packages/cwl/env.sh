if [ -z "$INSTALLER_CWL_ENV_SH" ]; then
    INSTALLER_CWL_ENV_SH=1
    installer_cwl_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_cwl_dir/../../env.sh

    name=cwl
    version=3.1.20210521105815
    visibility=public

    installer_init

    module load python/3.8.5
fi
