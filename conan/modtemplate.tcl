#%Module
module-whatis "Conan"

setenv CONAN_DIR "${prefix}"
set-alias conan {VIRTUAL_ENV=${prefix} ${prefix}/bin/conan}
