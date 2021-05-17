module load cmake/3.17.3
module load gcc/6.3.0
module load gsl/2.6-gcc6

cmake_vars[CMAKE_INSTALL_RPATH]=$(pkg-config --variable=libdir gsl)
