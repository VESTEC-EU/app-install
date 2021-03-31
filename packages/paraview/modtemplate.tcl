#%Module
module-whatis "ParaView-$version_full server (Catalyst edition)"

setenv PARAVIEW_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
setenv PARAVIEW_VERSION "${version}"
