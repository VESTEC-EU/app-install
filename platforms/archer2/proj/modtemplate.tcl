#%Module
module-whatis "PROJ ${version} geospatial coordinate library https://proj.org"

if {![is-loaded sqlite]} {
    module load sqlite/3.34.1
}

setenv PROJ_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
prepend-path MANPATH "${prefix}/share/man"
prepend-path LD_LIBRARY_PATH "${prefix}/lib64"
