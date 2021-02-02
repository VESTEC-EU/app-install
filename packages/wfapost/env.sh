if [ -z "$INSTALLER_WFAPOST_ENV_SH" ]; then
    INSTALLER_WFAPOST_ENV_SH=1
    installer_wfapost_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_wfapost_dir/../../env.sh

    name=wfapost
    version=main
    visibility=private

    wfapost_gdal_version=3.1.0

    installer_init
fi
