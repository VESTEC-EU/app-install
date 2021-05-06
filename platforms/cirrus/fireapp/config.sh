module load gcc/6.3.0
export CC=$(which gcc)
module load cmake/3.17.3
module load netcdf/4.7.4
module load gdal/3.1.0
module load conan/1.31.3
module load mpt/2.22
module load paraview/5.9.0
module load python/3.8.5
cmake_vars[MPI_CXX_LINK_FLAGS]=-Wl,-rpath=$MPI_ROOT/lib
