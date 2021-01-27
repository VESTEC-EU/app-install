if [ -z "$INSTALLER_FIREAPP_ENV_SH" ]; then
    INSTALLER_FIREAPP_ENV_SH=1

    export installer_fireapp_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_fireapp_dir/../../env.sh

    # Closed source, keep VESTEC only
    export app_dir=$priv_app_dir
    export mod_dir=$priv_mod_dir

    export name=fireapp
    export version=Catalyst
    export prefix=$app_dir/$name/$version

    module load gcc/6.3.0
    module load cmake/3.17.3
    #module load hdf5/1.10.7
    module load netcdf/4.7.4
    module load gdal/3.1.0
    module load conan/1.31.3
    module load mpt/2.22

    source_dir_name=fireapp
    build_dir_name=build-$version

    declare -A cmake_vars
    cmake_vars[BUILD_SHARED_LIBS]=ON
    cmake_vars[FIREAPP_CONAN]=ON
    cmake_vars[FIREAPP_CONAN_GDAL]=OFF
    cmake_vars[CONAN_CMD]=$CONAN_DIR/bin/conan
fi
