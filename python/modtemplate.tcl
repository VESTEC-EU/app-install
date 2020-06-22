#%Module
module-whatis "Python"

conflict python-compute
conflict anaconda
conflict anaconda-compute
if {![is-loaded libffi]} {
    module load libffi
}

prepend-path PATH "${python_prefix}/bin"
