if [ -z "$INSTALLER_PARAVIEW_ENV_SH" ]; then
    INSTALLER_PARAVIEW_ENV_SH=1
    installer_paraview_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_paraview_dir/../../env.sh

    visibility=public
    name=paraview
    version=5.9.0
    version_tag=v${version}

    source_dir_name=paraview-$version_tag
    build_dir_name=build-$version_tag

    installer_init

    declare -A cmake_vars
    cmake_vars[BUILD_TESTING]=OFF
    cmake_vars[PARAVIEW_BUILD_SHARED_LIBS]=ON
    cmake_vars[PARAVIEW_BUILD_EDITION]=CATALYST_RENDERING
    cmake_vars[paraview_SOURCE_SELECTION]=$version
    cmake_vars[ENABLE_boost]=ON
    cmake_vars[ENABLE_protobuf]=ON
    cmake_vars[ENABLE_python]=ON
    cmake_vars[ENABLE_python3]=ON
    cmake_vars[USE_SYSTEM_python3]=OFF
fi
