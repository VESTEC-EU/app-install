module load PrgEnv-gnu
module load cmake/3.18.4
module swap gcc gcc/10.2.0
module load python/3.8.5
module load boost/1.72.0
# To let CMake find boost no bother
export Boost_ROOT=$BOOST_DIR
