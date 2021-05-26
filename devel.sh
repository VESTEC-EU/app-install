# Helpers for developing/debugging installs.
# 
# Source this in your shell to use it.

_pkgshell_installer_dir=$(readlink -f $(dirname $BASH_SOURCE))

# Open a shell with the environment setup by a package's env.sh
#
# Usage:
#   pkgshell <package name>
#
function pkgshell() {
    pkg=$1
    pkg_dir=$_pkgshell_installer_dir/packages/$pkg
    if [ ! -d $pkg_dir ]; then
	echo "No package dir $pkg"
	return 1
    fi
    pkg_env=$pkg_dir/env.sh

    tmp_rc=$(mktemp)
    cat > $tmp_rc <<EOF
thisdir=$pkg_dir
. $pkg_env
set +e
set +u
EOF
    bash --rcfile $tmp_rc
    ret=$?
    rm $tmp_rc
    return $ret
}

# Just echo the standard preamble to a build step
function preamble () {
    cat <<"EOF"
#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh
EOF
}

function init_pkg() {
    local vis
    local build
    local force=0
    local pkg
    local PKG

    while [[ $# -gt 0 ]]; do
	echo $1
	case $1 in
	    -public)
		if [ -z "${vis+set}" ]; then
		    vis=public
		    shift
		else
		    echo "visibility already set"
		    return 1
		fi
		;;
	    -private)
		if [ -z "${vis+set}" ]; then
		    vis=private
		    shift
		else
		    echo "visibility already set"
		    return 1
		fi
		;;
	    -cmake)
		if [ -z "${build+set}" ]; then
		    build=cmake
		    shift
		else
		    echo "build type already set"
		    return 1
		fi
		;;
	    -autotools)
		if [ -z "${build+set}" ]; then
		    build=autotools
		    shift
		else
		    echo "build type already set"
		    return 1
		fi
		;;
	    -pip)
		if [ -z "${build+set}" ]; then
		    build=pip
		    shift
		else
		    echo "build type already set"
		    return 1
		fi
		;;
	    -force)
		force=1
		shift
		;;
	    *)
		pkg=$1
		shift
		if [ $# -gt 0 ]; then
		    echo "Too many args"
		    return 1
		fi
		;;
	esac
    done

    vis=${vis:-public}
    build=${build:-unknown}
    PKG=${pkg^^}

    function should_write_file {
	if [ -f $1 ]; then
	    if [ $force = 1 ]; then
		echo "Warning: overwriting file '$1'"
		return 0
	    else
		echo "File exists '$1'"
		return 1
	    fi
	else
	    return 0
	fi
    }

    local pkg_dir=$_pkgshell_installer_dir/packages/$pkg
    if [ -d $pkg_dir ]; then
	echo "Package dir already exists: $pkg_dir"
    else
	mkdir -p $pkg_dir
    fi

    local buildbits=""
    if [ $build = cmake ]; then
	read -d '' buildbits <<EOF
    # build_dir_name=set me!
    declare -A cmake_vars
EOF
    elif [ $build = autotools ]; then
	read -d '' buildbits <<EOF
    $configure_other_args=
EOF
    fi

    pushd $pkg_dir
    if should_write_file env.sh; then
	cat > env.sh <<EOF
if [ -z "\$INSTALLER_${PKG}_ENV_SH" ]; then
    INSTALLER_${PKG}_ENV_SH=1
    installer_${pkg}_dir=\$(readlink -f \$(dirname \$BASH_SOURCE))
    . \$installer_${pkg}_dir/../../env.sh

    visibility=$vis
    name=$pkg
    # version=set me!

    # source_dir_name=set me!
    
    $buildbits

    installer_init
fi
EOF
    fi

    if [ $build = pip ]; then
	if should_write_file download.sh; then
	    rm -f download.sh
	    ln -s "../../generic/${build}/download.sh"
	fi
    fi

    if [ $build != custom ] ; then
	for step in configure build install; do
	    if should_write_file "${step}.sh"; then
		rm -f "${step}.sh"
		ln -s "../../generic/${build}/${step}.sh"
	    fi
	done
    fi

    if should_write_file module.sh; then
	rm -f module.sh
	ln -s "../../generic/module.sh"
    fi
    if should_write_file all.sh; then
	rm -f all.sh
	ln -s "../../generic/all.sh"
    fi

    # Start anything we've not done with the basic preamble
    for step in download configure build install module; do
	if [ ! -f "${step}.sh" ]; then
	    preamble > "${step}.sh"
	    chmod a+x "${step}.sh"
	fi
    done

    if should_write_file modtemplate.tcl; then
	cat > modtemplate.tcl <<EOF
#%Module
module-whatis "${pkg} version \${version}"

setenv ${PKG}_DIR "\${prefix}"

EOF
    fi

    popd
}
