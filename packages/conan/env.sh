if [ -z "$INSTALLER_CONAN_ENV_SH" ]; then
    INSTALLER_CONAN_ENV_SH=1
    installer_conan_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_conan_dir/../../env.sh

    name=conan
    version=1.31.3
    visibility=public

    installer_init

    module load python/3.8.5
fi
