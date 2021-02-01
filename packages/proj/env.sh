if [ -z "$INSTALLER_PROJ_ENV_SH" ]; then
    INSTALLER_PROJ_ENV_SH=1
    installer_proj_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_proj_dir/../../env.sh

    name=proj
    version=6.2.1
    visibility=public

    source_dir_name=proj-$version
    build_dir_name=build-$version

    declare -A cmake_vars
    installer_init
fi
