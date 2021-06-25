if [ -z "$INSTALLER_PYDEV_ENV_SH" ]; then
    INSTALLER_PYDEV_ENV_SH=1
    installer_pydev_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_pydev_dir/../../env.sh

    visibility=public
    name=pydev
    version=3.8.5

    installer_init
fi
