if [ -z "$INSTALLER_LIBFFI_ENV_SH" ]; then
    INSTALLER_LIBFFI_ENV_SH=1
    installer_libffi_dir=$(readlink -f $(dirname $BASH_SOURCE))

    . $installer_libffi_dir/../../env.sh

    visibility=public
    name=libffi
    version=3.3
    source_dir_name=libffi-3.3

    installer_init
fi
