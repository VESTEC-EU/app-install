if [ -z "$INSTALLER_LIBFFI_ENV_SH" ]; then
    INSTALLER_LIBFFI_ENV_SH=1

    export installer_libffi_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_libffi_dir/../env.sh
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export name=libffi
    export version=3.3
    export prefix=$app_dir/$name/$version
    export source_dir_name=libffi-3.3

    module load gcc/6.3.0
fi
