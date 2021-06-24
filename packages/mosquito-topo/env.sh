if [ -z "$INSTALLER_MOSQUITO_TOPO_ENV_SH" ]; then
    INSTALLER_MOSQUITO_TOPO_ENV_SH=1
    installer_mosquito_topo_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_mosquito_topo_dir/../../env.sh

    visibility=private
    name=mosquito-topo
    version=0.2.0

    source_dir_name=mosquito-topological-processing
    my_gdal_version=3.1.0

    download_git_repo="git@github.com:VESTEC-EU/mosquito-topological-processing.git"
    installer_init
fi
