if [ -z "$INSTALLER_WFAPOST_ENV_SH" ]; then
    INSTALLER_WFAPOST_ENV_SH=1

    export installer_wfapost_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_wfapost_dir/../env.sh

    # Closed source, keep VESTEC only
    export app_dir=$priv_app_dir
    export mod_dir=$priv_mod_dir

    export name=wfapost
    export version=main
    export prefix=$app_dir/$name/$version

    wfapost_gdal_version=3.1.0

    module load python/3.8.5
    module load gdal/$wfapost_gdal_version
fi
