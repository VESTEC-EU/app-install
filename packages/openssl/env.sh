if [ -z "$INSTALLER_OPENSSL_ENV_SH" ]; then
    INSTALLER_OPENSSL_ENV_SH=1
    installer_openssl_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_openssl_dir/../../env.sh

    name=openssl
    version=1.1.1d
    visibility=public

    source_dir_name=openssl-OpenSSL_1_1_1d

    installer_init
fi
