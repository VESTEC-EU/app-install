module load PrgEnv-gnu

module load cmake/3.18.4
module load gcc/10.2.0
module load python/3.8.5
module load boost/1.72.0
# To let CMake find boost no bother
export Boost_ROOT=$BOOST_DIR
module load eigen/3.4.0
export Eigen3_ROOT=/work/y07/shared/libs/core/eigen/3.4.0

# Ensure that TTK and its python modules are installed consistently
cmake_vars[CMAKE_INSTALL_LIBDIR]=lib
cmake_vars[MPI_C_COMPILER]=cc
cmake_vars[MPI_CXX_COMPILER]=CC
cmake_vars[Boost_USE_STATIC_LIBS]=ON
