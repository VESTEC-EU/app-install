# This totally wipes module setup
module restore -s PrgEnv-gnu
# Ensure our modules are available
mod_use_idem $pub_mod_dir
mod_use_idem $priv_mod_dir

module swap gcc gcc/10.1.0
module load proj/6.2.1
module load cray-hdf5/1.12.0.2

