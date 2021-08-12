#%Module
module-whatis "TTK version ${version}"

if {![is-loaded paraview]} {
    module load paraview/${pv_version}
}

if {![is-loaded boost]} {
    module load boost/1.73.0
}

setenv TTK_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"

prepend-path PV_PLUGIN_PATH "${prefix}/bin/plugins"

