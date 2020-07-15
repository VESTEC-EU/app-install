module swap PrgEnv-cray PrgEnv-gnu
#module add anaconda/2.2.0-python3
module add cmake/3.16.0
module add cray-netcdf/4.6.1.3
module add cray-hdf5/1.10.2.0
module add boost
module swap gcc gcc/7.3.0
module swap cray-mpich cray-mpich/7.7.4

export CRAYPE_LINK_TYPE=dynamic
export TERM=xterm

