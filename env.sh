if [ -z "$INSTALLER_ENV_SH" ]; then
    INSTALLER_ENV_SH=1

    installer_dir=$(readlink -f $(dirname $BASH_SOURCE))
    if [ -f $installer_dir/config.sh ]; then
	. $installer_dir/config.sh
	# Check for required variables
	for varname in platform pub_app_dir pub_mod_dir priv_app_dir priv_mod_dir make_parallelism;  do
	    if [ -z "${!varname}" ]; then
		echo "config.sh does not define required variable $varname"
		exit 1
	    fi
	done
    else
	echo "config.sh does not exist"
	exit 1
    fi

    # Idempotent version of module use
    function mod_use_idem {
	for mod_dir in "$@"; do
	    if [[ ! "$MODULEPATH" =~ ".*$mod_dir.*" ]]; then
		module use $mod_dir
	    fi
	done
    }

    mod_use_idem $pub_mod_dir
    mod_use_idem $priv_mod_dir

    platform_dir=$installer_dir/platforms/$platform
    if [ -d $platform_dir ]; then
	export platform_dir
	if [ -f $platform_dir/env.sh ]; then
	    . $platform_dir/env.sh
	fi
    else
	echo "Platform directory for '$platform' does not exist"
	exit 1
    fi
fi
