#%Module
module-whatis "ParaView-$version server (Catalyst edition)"

if {![is-loaded python]} {
    module load python/3.8.5
}
setenv VIRTUAL_ENV "${prefix}"
setenv PARAVIEW_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
setenv PARAVIEW_VERSION "${version}"
