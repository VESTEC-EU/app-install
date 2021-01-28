if [ -z "$INSTALLER_PYTHON_ENV_SH" ]; then
    INSTALLER_PYTHON_ENV_SH=1
    installer_python_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_python_dir/../../env.sh

    name=python
    version=3.8.5
    visibility=public

    source_dir_name=Python-$version
    build_dir_name=pybuild

    installer_init
fi
