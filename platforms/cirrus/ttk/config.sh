module load cmake/3.17.3
module load gcc/6.3.0
module load python/3.8.5
module load boost/1.73.0
module load eigen/3.3.9
export Eigen3_ROOT=$EIGEN_DIR
# Ensure that TTK and its python modules are installed consistently
cmake_vars[CMAKE_INSTALL_LIBDIR]=lib
