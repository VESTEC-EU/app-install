# This totally wipes module setup
module restore -s PrgEnv-gnu
# Ensure our modules are available
mod_use_idem $pub_mod_dir
mod_use_idem $priv_mod_dir

module swap gcc gcc/10.1.0

export VER_MPI=MPICRAY
export ARCH=LXgfortran
export OPTLEVEL=O2
export CC=gcc
export CXX=g++

