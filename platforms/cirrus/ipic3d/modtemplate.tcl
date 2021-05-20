#%Module
module-whatis "iPIC3d"

if { ![is-loaded intel-mpi-19] } {
    module load intel-mpi-19/19.0.0.117
}

setenv iPIC3D_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
