if [ -z "$INSTALLER_MOSQUITODATA_ENV_SH" ]; then
    INSTALLER_MOSQUITODATA_ENV_SH=1
    installer_mosquitodata_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_mosquitodata_dir/../../env.sh

    visibility=private
    name=mosquitodata
    version=0.1.0

    installer_init
fi
