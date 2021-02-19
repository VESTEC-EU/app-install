if [ -z "$INSTALLER_NCL_ENV_SH" ]; then
    INSTALLER_NCL_ENV_SH=1
    installer_ncl_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_ncl_dir/../../env.sh

    name=ncl
    version=6.6.2
    visibility=public

    installer_init
fi
