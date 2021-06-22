#%Module
module-whatis "iPIC3d"

setenv iPIC3D_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"

setenv iPIC3D_DATA "${prefix}/share/ipic3d/inputfiles"

if {![is-loaded libfabric]} {
    module load libfabric/1.11.0.0.233
}
