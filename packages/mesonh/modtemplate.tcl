#%Module
module-whatis "Meso-NH weather code v$version"

setenv MESONH_DIR "${prefix}"
prepend-path PATH "${prefix}/${ARCH}-${OPTLEVEL}"
setenv MESONH_DATA_DIR "${pub_data_dir}/mesonh"
