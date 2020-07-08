#%Module
module-whatis "WFA post processing script"

module load python/3.8.3

setenv WFAPOST_DIR "${wfapost_install_dir}"
setenv VIRTUAL_ENV "${wfapost_install_dir}"
prepend-path PATH "${wfapost_install_dir}/bin"
