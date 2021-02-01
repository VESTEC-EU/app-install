if [ -z "$INSTALLER_SQLITE_ENV_SH" ]; then
    INSTALLER_SQLITE_ENV_SH=1
    installer_sqlite_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_sqlite_dir/../../env.sh

    name=sqlite
    version=3.34.1
    visibility=public

    source_dir_name=sqlite-autoconf-3340100
    configure_other_args=""

    installer_init
fi
