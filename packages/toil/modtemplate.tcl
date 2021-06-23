#%Module
module-whatis "Toil ${version} http://toil.ucsc-cgl.org"

# module load python/3.8.3

setenv TOIL_DIR "${prefix}"
setenv VIRTUAL_ENV "${prefix}"
prepend-path PATH "${prefix}/bin"
