#%Module
module-whatis "PROJ ${proj_version} geospatial coordinate library https://proj.org"

setenv PROJ_DIR "${proj_prefix}"
prepend-path PATH "${proj_prefix}/bin"
prepend-path MANPATH "${proj_prefix}/share/man"
prepend-path LD_LIBRARY_PATH "${proj_prefix}/lib64"

