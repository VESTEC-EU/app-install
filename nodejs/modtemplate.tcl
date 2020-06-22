#%Module
module-whatis "Node.JS"

conflict gcc/4.8.1 gcc/4.9.2 gcc/4.9.3
if {![is-loaded gcc]} {
    module load gcc/6.3.0
}

setenv NODEJS_DIR "${nodejs_prefix}"
prepend-path PATH "${nodejs_prefix}/bin"
prepend-path MANPATH "${nodejs_prefix}/share/man"

