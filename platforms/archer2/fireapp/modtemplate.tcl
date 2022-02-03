#%Module
module-whatis "Wildfire Analyst VESTEC app"

setenv FIREAPP_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"

if {![is-loaded gcc]} {
    module load gcc/10.2.0
}
