#%Module
module-whatis "Python"

conflict cray-python
conflict conda

if {![is-loaded libffi]} {
    module load libffi/3.3
}
if {![is-loaded sqlite]} {
    module load sqlite/3.34.1
}

prepend-path PATH "${prefix}/bin"
setenv PIP_REQUIRE_VIRTUALENV "true"
