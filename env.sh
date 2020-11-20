if [ -z "$INSTALLER_ENV_SH" ]; then
    INSTALLER_ENV_SH=1

    installer_dir=$(readlink -f $(dirname $BASH_SOURCE))

    export vestec=dc118
    export pub_app_dir=/lustre/home/shared/$vestec/sw
    export pub_mod_dir=/lustre/home/shared/$vestec/modules
    module use $pub_mod_dir

    export priv_app_dir=/lustre/home/$vestec/shared/sw
    export priv_mod_dir=/lustre/home/$vestec/shared/modules
    module use $priv_mod_dir
fi
