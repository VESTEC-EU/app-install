if [ -z "$INSTALLER_MOSQUITO_ENV_SH" ]; then
    INSTALLER_MOSQUITO_ENV_SH=1
    installer_mosquito_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_mosquito_dir/../../env.sh

    # Closed source, keep VESTEC only
    visibility=private
    name=mosquito
    version=0.2.0

    source_dir_name=use-case-mosquito
    cmake_dir_name=${source_dir_name}/code_mosquito
    build_dir_name=build-$version

    declare -A cmake_vars

    installer_init

fi
