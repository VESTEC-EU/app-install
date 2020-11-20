if [ -z "$INSTALLER_ENV_SH" ]; then
    INSTALLER_ENV_SH=1

    installer_dir=$(readlink -f $(dirname $BASH_SOURCE))

    # Idempotent version of module use
    function mod_use_idem {
	for mod_dir in "$@"; do
	    if [[ ! "$MODULEPATH" =~ ".*$mod_dir.*" ]]; then
		module use $mod_dir
	    fi
	done
    }

    export vestec=dc118

    export pub_app_dir=/lustre/home/shared/$vestec/sw
    export pub_mod_dir=/lustre/home/shared/$vestec/modules
    mod_use_idem $pub_mod_dir

    export priv_app_dir=/lustre/home/$vestec/shared/sw
    export priv_mod_dir=/lustre/home/$vestec/shared/modules
    mod_use_idem $priv_mod_dir

    export make_parallelism=16
fi
