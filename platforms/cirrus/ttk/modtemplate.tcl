#%Module
module-whatis "TTK version ${version} including Paraview ${pv_version}"

setenv TTK_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"

if {![is-loaded boost]} {
    module load boost/1.73.0
}
