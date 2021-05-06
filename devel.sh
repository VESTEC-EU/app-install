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
    . $pkg_env
    set +e
    set +u
EOF
    bash --rcfile $tmp_rc
    ret=$?
    rm $tmp_rc
    return $ret
}

