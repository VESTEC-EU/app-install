#%Module
module-whatis "GDAL ${version} translator library for raster and vector geospatial data https://gdal.org"

setenv GDAL_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
prepend-path PKG_CONFIG_PATH "${prefix}/lib/pkgconfig"
