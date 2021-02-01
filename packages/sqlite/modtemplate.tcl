#%Module
module-whatis "SQLite database"

setenv SQLITE_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
prepend-path MANPATH "${prefix}/share/man"
prepend-path LD_LIBRARY_PATH "${prefix}/lib"
prepend-path PKG_CONFIG_PATH "${prefix}lib/pkgconfig"
