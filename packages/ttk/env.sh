if [ -z "$INSTALLER_TTK_ENV_SH" ]; then
    INSTALLER_TTK_ENV_SH=1
    installer_ttk_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_ttk_dir/../../env.sh

    # open source
    visibility=public
    name=ttk
    version=0.9.9

    source_dir_name=ttk-$version
    build_dir_name=build-$version

    # TTK needs a patched version of Paraview
    pv_version=5.8.1
    pv_source_dir_name=ParaView-v$pv_version

    declare -A cmake_vars

    installer_init

    if [ -x $prefix/bin/pvpython ]; then
	# This only possible after install; only needed for module
	pvpython_sitepackage_dir=$($prefix/bin/pvpython $thisdir/get_site_packages.py)
    fi
    if [ -f $prefix/bin/activate ]; then
	python_sitepackage_dir=$(
	    ( . /lustre/home/shared/dc118/sw/ttk/0.9.9/bin/activate;
	      python -c 'import sysconfig; print(sysconfig.get_path("platlib"))'
	    )
	)
    fi
fi
