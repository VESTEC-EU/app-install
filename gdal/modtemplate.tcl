#%Module
module-whatis "GDAL ${gdal_version} translator library for raster and vector geospatial data https://gdal.org"

module load proj/$proj_version
setenv GDAL_DIR "${gdal_prefix}"
prepend-path PATH "${gdal_prefix}/bin"
prepend-path PKG_CONFIG_PATH "${gdal_prefix}/lib/pkgconfig"
prepend-path LD_LIBRARY_PATH "${gdal_prefix}/lib"
