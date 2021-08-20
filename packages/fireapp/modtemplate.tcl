#%Module
module-whatis "Wildfire Analyst VESTEC app"

if {![is-loaded ttk]} {
    module load ttk/0.9.9
}
setenv FIREAPP_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
