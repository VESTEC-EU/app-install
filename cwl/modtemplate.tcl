#%Module
module-whatis "CWL reference runner"

module load python/3.8.3

setenv CWL_DIR "${cwl_install_dir}"
setenv VIRTUAL_ENV "${cwl_install_dir}"
prepend-path PATH "${cwl_install_dir}/bin"
