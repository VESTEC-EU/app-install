#%Module
module-whatis "netCDF ${version}"

module load zlib/1.2.11
setenv NETCDF_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
prepend-path LD_LIBRARY_PATH "${prefix}/lib64"
prepend-path PKG_CONFIG_PATH "${prefix}/lib64/pkgconfig"
