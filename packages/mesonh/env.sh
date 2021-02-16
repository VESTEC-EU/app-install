if [ -z "$INSTALLER_MESONH_ENV_SH" ]; then
    INSTALLER_MESONH_ENV_SH=1
    installer_mesonh_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_mesonh_dir/../../env.sh

    name=mesonh
    version=5.4.4
    visibility=public

    version_dashed=${version//./-}
    # We will put the source tree directly into the prefix and use Meso-NH's weird
    # conf/build/env system to manage the binaries

    installer_init

    conf_file=$prefix/conf/profile_mesonh-${ARCH}-R8I4-MNH-V${version_dashed}-${VER_MPI}-${OPTLEVEL}

    # MNH config file is not safe with -u
    set +u
fi
