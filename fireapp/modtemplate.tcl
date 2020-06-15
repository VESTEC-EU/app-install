#%Module
module-whatis "Wildfire Analyst VESTEC app"

module load gdal/${gdal_version}
setenv FIREAPP_DIR "${fireapp_prefix}"
prepend-path PATH "${fireapp_prefix}/bin"
