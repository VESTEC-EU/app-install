if [ -z "$INSTALLER_MOSQUITOPOST_ENV_SH" ]; then
    INSTALLER_MOSQUITOPOST_ENV_SH=1
    installer_mosquitopost_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_mosquitopost_dir/../../env.sh

    visibility=private
    name=mosquitopost
    version=0.2.1

    source_dir_name=use-case-mosquito

    my_gdal_version=3.1.0

    installer_init
fi
