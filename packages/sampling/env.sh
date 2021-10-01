if [ -z "$INSTALLER_SAMPLING_ENV_SH" ]; then
    INSTALLER_SAMPLING_ENV_SH=1
    installer_sampling_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_sampling_dir/../../env.sh

    visibility=public
    name=sampling
    version=robustness-hash
    version_tag=feature/robustness-hash

    source_dir_name=sampling-source
    build_dir_name=build-sampling

    declare -A cmake_vars
    cmake_vars[USE_CATALYST]=ON
#    cmake_vars[EXTERNALS_DIR]=$prefix

    installer_init
fi
