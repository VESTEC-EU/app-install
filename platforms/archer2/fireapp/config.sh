# This totally wipes module setup
module restore -s PrgEnv-gnu
# Ensure our modules are available
mod_use_idem $pub_mod_dir
mod_use_idem $priv_mod_dir

module swap gcc gcc/10.1.0
module load cmake/3.18.4
module load cray-hdf5/1.12.0.2 cray-netcdf/4.7.4.2
module load gdal/3.1.0
module load conan/1.31.3
module load paraview/5.9.0
