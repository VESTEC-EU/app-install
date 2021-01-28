if [ -z "$INSTALLER_NODEJS_ENV_SH" ]; then
    INSTALLER_NODEJS_ENV_SH=1
    installer_nodejs_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_nodejs_dir/../../env.sh

    name=nodejs
    version=12.16.1
    visibility=public

    source_dir_name=node-v$version

    installer_init
fi
