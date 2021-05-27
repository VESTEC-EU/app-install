if [ -z "$INSTALLER_TTK_ENV_SH" ]; then
    INSTALLER_TTK_ENV_SH=1
    installer_ttk_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_ttk_dir/../../env.sh

    # open source
    visibility=public
    name=ttk
    version=0.9.9

    source_dir_name=ttk-$version
    build_dir_name=build-$version

    # TTK needs a patched version of Paraview
    pv_version=5.8.1
    pv_source_dir_name=ParaView-v$pv_version

    declare -A cmake_vars

    installer_init
fi
