if [ -z "$INSTALLER_FIREAPP_ENV_SH" ]; then
    INSTALLER_FIREAPP_ENV_SH=1
    installer_fireapp_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_fireapp_dir/../../env.sh

    # Closed source, keep VESTEC only
    visibility=private
    name=fireapp
    version=Catalyst

    source_dir_name=fireapp
    build_dir_name=build-$version

    declare -A cmake_vars

    installer_init

    cmake_vars[BUILD_SHARED_LIBS]=ON
    cmake_vars[FIREAPP_CONAN]=ON
    cmake_vars[FIREAPP_CONAN_GDAL]=OFF
    cmake_vars[CONAN_CMD]=$CONAN_DIR/bin/conan
    cmake_vars[USE_CATALYST]=ON
    cmake_vars[ParaView_DIR]=$PARAVIEW_DIR/lib/cmake/paraview-$PARAVIEW_VERSION
fi
