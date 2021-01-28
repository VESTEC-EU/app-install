#%Module
module-whatis "Node.JS"

if {![is-loaded gcc]} {
    module load gcc/10.1.0
}
if {![is-loaded openssl]} {
    module load openssl/1.1.1d
}

setenv NODEJS_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
prepend-path MANPATH "${prefix}/share/man"

