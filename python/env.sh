if [ -z "$INSTALLER_PYTHON_ENV_SH" ]; then
    INSTALLER_PYTHON_ENV_SH=1

    export installer_python_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_python_dir/../env.sh

    # Open source, install world usable
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    export name=python
    export version=3.8.5
    export prefix=$app_dir/$name/$version

    source_dir_name=Python-$version
    build_dir_name=pybuild

    module load gcc/6.3.0
    module load zlib/1.2.11
    module load libffi/3.3
    module load openssl/1.1.1d
fi
