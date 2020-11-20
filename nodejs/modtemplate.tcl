#%Module
module-whatis "Node.JS"

if {![is-loaded gcc]} {
    module load gcc/6.3.0
}

setenv NODEJS_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
prepend-path MANPATH "${prefix}/share/man"

