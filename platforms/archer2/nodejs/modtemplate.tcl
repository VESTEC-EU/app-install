#%Module
module-whatis "Node.JS"

setenv NODEJS_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
prepend-path MANPATH "${prefix}/share/man"

