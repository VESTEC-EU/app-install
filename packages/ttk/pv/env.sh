if [ -z "$INSTALLER_TTK_PV_ENV_SH" ]; then
    INSTALLER_TTK_PV_ENV_SH=1
    installer_ttk_pv_dir=$(readlink -f $(dirname $BASH_SOURCE))

    # Include the parent dir's one and then override stuff
    . $installer_ttk_pv_dir/../env.sh

    source_dir_name=$pv_source_dir_name
    build_dir_name=pv-build-$pv_version
    make_parallelism=64
    unset cmake_vars
    declare -A cmake_vars

    cmake_vars[PARAVIEW_USE_PYTHON]=ON
    cmake_vars[PARAVIEW_INSTALL_DEVELOPMENT_FILES]=ON
    cmake_vars[PARAVIEW_PYTHON_VERSION]=3
    cmake_vars[PARAVIEW_USE_QT]=OFF
fi
