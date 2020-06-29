if [ -z "$INSTALLER_CONAN_ENV_SH" ]; then
    INSTALLER_CONAN_ENV_SH=1

    export installer_conan_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_conan_dir/../env.sh

    # Open source, install world usable
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export conan_version=1.26.0
    export conan_prefix=$app_dir/conan/$conan_version

    module load python/3.8.3
fi
