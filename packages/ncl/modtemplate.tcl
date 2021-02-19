#%Module
module-whatis "NCL"

if {![is-loaded conda]} {
    module load conda/4.9.2
}
prepend-path PATH "${prefix}/bin"
setenv CONDA_PREFIX "${prefix}"
setenv NCARG_ROOT "${prefix}"
