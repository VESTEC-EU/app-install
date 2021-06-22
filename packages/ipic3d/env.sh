if [ -z "$INSTALLER_IPIC3D_ENV_SH" ]; then
    INSTALLER_IPIC3D_ENV_SH=1
    installer_ipic3d_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_ipic3d_dir/../../env.sh

    # Closed source, keep VESTEC only
    visibility=public
    name=ipic3d
    version=main

    source_dir_name=ipic3d-klm
    build_dir_name=build-$version

    declare -A cmake_vars
    cmake_vars[USE_CATALYST]=ON
    cmake_vars[USE_HDF5]=ON
    cmake_vars[BUILD_SHARED_LIBS]=ON
    # Build is broken with -DNDEBUG
    cmake_vars[CMAKE_CXX_FLAGS_RELEASE]=-O3
    installer_init
fi
