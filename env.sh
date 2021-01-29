if [ -z "$INSTALLER_ENV_SH" ]; then
    INSTALLER_ENV_SH=1

    # Terminate on error
    set -e
    # Referencing an undefined variable is an error
    set -u

    # Root dir
    installer_dir=$(readlink -f $(dirname $BASH_SOURCE))

    # Read the config file
    if [ -f $installer_dir/config.sh ]; then
	. $installer_dir/config.sh
	# Check for required variables
	varnames=(platform)
	for vis in pub priv; do
	    for x in app mod data; do
		varnames+=("${vis}_${x}_dir")
	    done
	done

	for varname in ${varnames[@]};  do
	    if [ -z "${!varname}" ]; then
		echo "config.sh does not define required variable $varname"
		exit 1
	    fi
	done

	# Assign defaults if they've not been provided
	make_parallelism=${make_parallelism:-16}
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

    # Ensure our modules are available
    mod_use_idem $pub_mod_dir
    mod_use_idem $priv_mod_dir

    # Initialise to work on a package
    function installer_init {
	# Check we have set the required variables in our package env
	local varname
	for varname in name version visibility; do
	    if [ -z "${!varname}" ]; then
		echo "package env does not define required variable $varname"
		exit 1
	    fi
	done

	# Read in the platform's configuration
	platform_dir=$installer_dir/platforms/$platform
	if [ -d $platform_dir ]; then
	    if [ -f $platform_dir/env.sh ]; then
		. $platform_dir/env.sh
	    fi
	else
	    echo "Platform directory for $platform does not exist"
	    exit 1
	fi

	# Setup for world/project readable installation
	case $visibility in
	    pub|public)
		app_dir=$pub_app_dir
		mod_dir=$pub_mod_dir
		data_dir=$pub_data_dir
		;;
	    priv|private)
		app_dir=$priv_app_dir
		mod_dir=$priv_mod_dir
		data_dir=$priv_data_dir
		;;
	    *)
		echo "Unknown package visibility: $visibility"
		exit 1
		;;
	esac

	# The destination for the package's tree
	prefix=$app_dir/$name/$version

	# Now read any package-specific config for the platform
	package_platform_dir="$platform_dir/$name"
	local conf="$package_platform_dir/config.sh"
	if [ -d "$package_platform_dir" ]; then
	    if [ -f "$conf" ]; then
		. "$conf"
	    else
		echo "No file $conf"
	    fi
	else
	    echo "No directory $package_platform_dir"
	fi
    }

fi
