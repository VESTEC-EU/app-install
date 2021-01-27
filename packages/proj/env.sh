if [ -z "$INSTALLER_PROJ_ENV_SH" ]; then
    INSTALLER_PROJ_ENV_SH=1

    export installer_proj_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_proj_dir/../../env.sh

    # Open source, install world usable
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export name=proj
    export version=6.2.1
    export prefix=$app_dir/$name/$version

    source_dir_name=proj-$version
    build_dir_name=build-$version

    module load gcc gcc/6.3.0
    module load cmake/3.17.3
fi
