if [ -z "$INSTALLER_OPENSSL_ENV_SH" ]; then
    INSTALLER_OPENSSL_ENV_SH=1

    export installer_openssl_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_openssl_dir/../env.sh
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export name=openssl
    export version=1.1.1d
    export prefix=$app_dir/$name/$version
    export source_dir_name=openssl-OpenSSL_1_1_1d

    module load gcc/6.3.0
fi
