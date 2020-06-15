#%Module
module-whatis "Meso-NH weather code v5.4.2"

setenv MESONH_DIR "${mesonh_prefix}"
prepend-path PATH "${mesonh_prefix}/${ARCH}-${OPTLEVEL}"
