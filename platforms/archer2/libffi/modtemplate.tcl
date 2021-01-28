#%Module
module-whatis "libffi"

module load gcc/10.1.0
setenv LIBFFI_DIR "${prefix}"
prepend-path LD_LIBRARY_PATH "${prefix}/lib64"
prepend-path PKG_CONFIG_PATH "${prefix}/lib/pkgconfig"
