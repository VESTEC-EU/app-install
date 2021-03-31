# This totally wipes module setup
module restore -s PrgEnv-gnu
# Ensure our modules are available
mod_use_idem $pub_mod_dir
mod_use_idem $priv_mod_dir

module load cmake/3.18.4
module load gcc/10.1.0

