if [ -z "$INSTALLER_MESONH_ENV_SH" ]; then
    INSTALLER_MESONH_ENV_SH=1

    export installer_mesonh_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_mesonh_dir/../env.sh
    export mesonh_version=5.4.2

    # Open source, install world usable
    export app_dir=$pub_app_dir
    export mod_dir=$pub_mod_dir

    # We will put the source tree here and use Meso-NH's weird
    # conf/build/env system to manage the binaries
    export mesonh_prefix=$app_dir/mesonh/$mesonh_version

    module load mpt
    module load intel-compilers-19
    module load hdf5parallel/1.10.6-intel19-mpt222
    module load ncl
    module load gcc

    export VER_MPI=MPIAUTO
    export ARCH=LXifort
    export OPTLEVEL=O2
    export CC=gcc
    export CXX=g++
    export VERSION_NCL=6.6.2
    export NEED_NCARG=NO
    conf_file=$mesonh_prefix/conf/profile_mesonh-${ARCH}-R8I4-MNH-V5-4-2-${VER_MPI}-${OPTLEVEL}
fi
