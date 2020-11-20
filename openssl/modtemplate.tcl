#%Module
module-whatis "openssl"

setenv OPENSSL_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
prepend-path LD_LIBRARY_PATH "${prefix}/lib"
prepend-path PKG_CONFIG_PATH "${prefix}/lib/pkgconfig"
prepend-path MANPATH "${prefix}/share/man"
