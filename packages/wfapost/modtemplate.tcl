#%Module
module-whatis "WFA post processing script"

module load python/3.8.5

setenv WFAPOST_DIR "${prefix}"
setenv VIRTUAL_ENV "${prefix}"
prepend-path PATH "${prefix}/bin"
