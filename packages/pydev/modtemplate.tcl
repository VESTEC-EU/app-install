#%Module
module-whatis "Python with a venv setup for development ${version}"

setenv VIRTUAL_ENV "${prefix}"
prepend-path PATH "${prefix}/bin"
