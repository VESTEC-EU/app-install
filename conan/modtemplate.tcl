#%Module
module-whatis "Conan"

setenv CONAN_DIR "${conan_prefix}"
set-alias conan {VIRTUAL_ENV=${conan_prefix} ${conan_prefix}/bin/conan}
