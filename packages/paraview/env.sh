if [ -z "$INSTALLER_PARAVIEW_ENV_SH" ]; then
    if git rev-parse --is-inside-work-tree > /dev/null 2> /dev/null; then
	echo "Paraview superbuild will fail if run from inside a git repo."
	echo "Please use a build directory outwith a git repo."
	exit 1
    fi

    INSTALLER_PARAVIEW_ENV_SH=1
    installer_paraview_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_paraview_dir/../../env.sh

    visibility=public
    name=paraview
    version_bare=5.9.0
    version=mpi-$version_bare
    version_tag=v5.9.0
    numpy_version=1.19.2

    source_dir_name=paraview-$version_tag
    build_dir_name=build-$version_tag

    declare -A cmake_vars

    installer_init

    cmake_vars[BUILD_TESTING]=OFF
    cmake_vars[PARAVIEW_BUILD_SHARED_LIBS]=ON
    cmake_vars[PARAVIEW_BUILD_EDITION]=CATALYST_RENDERING
    cmake_vars[paraview_SOURCE_SELECTION]=$version_bare
    cmake_vars[ENABLE_boost]=ON
    cmake_vars[USE_SYSTEM_boost]=ON
    cmake_vars[ENABLE_numpy]=ON
    cmake_vars[USE_SYSTEM_numpy]=ON
    cmake_vars[ENABLE_protobuf]=ON
    cmake_vars[ENABLE_python]=ON
    cmake_vars[ENABLE_python3]=ON
    cmake_vars[USE_SYSTEM_python3]=ON
    cmake_vars[ENABLE_gdal]=ON
    cmake_vars[USE_SYSTEM_zlib]=ON
    cmake_vars[ENABLE_mpi]=ON
    cmake_vars[USE_SYSTEM_mpi]=ON

    # PV superbuild uses this instead of CMAKE_INSTALL_PREFIX
    cmake_vars[superbuild_install_location]=$prefix
    # Also doesn't use the standard -j flag for parallelism
    cmake_vars[SUPERBUILD_PROJECT_PARALLELISM]=$make_parallelism

    python_layer_env=$(prefix=$prefix python3 $installer_dir/generic/pip/module_venv_paths.py)
fi
