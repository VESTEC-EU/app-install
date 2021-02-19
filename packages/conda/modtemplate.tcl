#%Module
module-whatis "Conda"

conflict python

setenv CONDA_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
