#%Module
module-whatis "Python"

conflict cray-python

if {![is-loaded libffi]} {
    module load libffi/3.3
}

prepend-path PATH "${prefix}/bin"
