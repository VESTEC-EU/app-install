#%Module
module-whatis "ParaView-$version server (Catalyst edition)"

setenv PARAVIEW_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
setenv PARAVIEW_VERSION "${version}"
