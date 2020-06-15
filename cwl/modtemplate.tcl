#%Module
module-whatis "CWL reference runner"

module load python-compute/3.6.0_gcc6.1.0

setenv CWL_DIR "${cwl_install_dir}"
setenv VIRTUAL_ENV "${cwl_install_dir}"
prepend-path PATH "${cwl_install_dir}/bin"
