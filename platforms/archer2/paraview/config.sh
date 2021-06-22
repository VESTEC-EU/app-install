# This totally wipes module setup
module restore -s PrgEnv-gnu
# Ensure our modules are available
mod_use_idem $pub_mod_dir
mod_use_idem $priv_mod_dir

module load cmake/3.18.4
module load gcc/10.1.0
module load python/3.8.5
module load boost/1.72.0
# To let CMake find boost no bother
export Boost_ROOT=$BOOST_DIR
