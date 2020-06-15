if [ -z "$INSTALLER_ENV_SH" ]; then
    INSTALLER_ENV_SH=1

    installer_dir=$(readlink -f $(dirname $BASH_SOURCE))

    export vestec_base=/work/z01/z01/shared/vestec
    export app_dir=$vestec_base/apps
    export mod_dir=$vestec_base/modules
    module use $mod_dir
fi
