#%Module
module-whatis "PROJ ${version} geospatial coordinate library https://proj.org"

setenv PROJ_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
prepend-path MANPATH "${prefix}/share/man"
prepend-path LD_LIBRARY_PATH "${prefix}/lib64"
