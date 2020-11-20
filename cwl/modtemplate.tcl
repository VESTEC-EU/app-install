#%Module
module-whatis "CWL reference runner"

# module load python/3.8.3

setenv CWL_DIR "${prefix}"
# setenv VIRTUAL_ENV "${prefix}"
prepend-path PATH "${prefix}/bin"
