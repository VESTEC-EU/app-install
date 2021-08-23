if [ -z "$INSTALLER_CMAKE_ENV_SH" ]; then
    INSTALLER_CMAKE_ENV_SH=1
    installer_cmake_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_cmake_dir/../../env.sh

    visibility=public
    name=cmake
    version=3.20.1
    version_tag=v${version}

    source_dir_name=cmake-$version_tag
    build_dir_name=build-cmake-$version_tag

    installer_init

    declare -A cmake_vars
    cmake_vars[BUILD_TESTING]=OFF
fi
