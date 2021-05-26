if [ -z "$INSTALLER_EIGEN_ENV_SH" ]; then
    INSTALLER_EIGEN_ENV_SH=1
    installer_eigen_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_eigen_dir/../../env.sh

    visibility=public
    name=eigen
    version=3.3.9

    source_dir_name=eigen-$version
    
    build_dir_name=build-$version
    declare -A cmake_vars

    installer_init
fi
