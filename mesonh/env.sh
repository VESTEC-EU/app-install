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

    module load cdt/18.12
    module swap PrgEnv-cray PrgEnv-intel
    module load cray-hdf5/1.10.2.0
    module load ncl/6.4.0

    export VER_MPI=MPICRAY
    export ARCH=LXifort
    export OPTLEVEL=O2
    export CC=gcc
    export CXX=g++
    export VERSION_NCL=6.4.0
    export NEED_NCARG=NO
    conf_file=$mesonh_prefix/conf/profile_mesonh-${ARCH}-R8I4-MNH-V5-4-2-${VER_MPI}-${OPTLEVEL}

fi
