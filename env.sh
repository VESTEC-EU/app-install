if [ -z "$INSTALLER_ENV_SH" ]; then
    INSTALLER_ENV_SH=1

    installer_dir=$(readlink -f $(dirname $BASH_SOURCE))

    export vestec=d170
    export pub_app_dir=/home/$vestec/shared/sw
    export pub_mod_dir=/home/$vestec/shared/modules
    module use $pub_mod_dir

    export priv_app_dir=/home/$vestec/$vestec/shared/sw
    export priv_mod_dir=/home/$vestec/$vestec/shared/modules
    module use $priv_mod_dir
fi
