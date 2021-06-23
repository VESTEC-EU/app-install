if [ -z "$INSTALLER_TOIL_ENV_SH" ]; then
    INSTALLER_TOIL_ENV_SH=1
    installer_toil_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_toil_dir/../../env.sh

    visibility=public
    name=toil
    version=5.3.0

    installer_init

    module load python/3.8.5
fi
