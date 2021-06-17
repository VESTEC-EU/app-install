#%Module
module-whatis "mosquitopost version ${version}"

module load python/3.8.5

setenv MOSQUITOPOST_DIR "${prefix}"
setenv VIRTUAL_ENV "${prefix}"
prepend-path PATH "${prefix}/bin"
