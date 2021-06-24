#%Module
module-whatis "TTK version ${version} including Paraview ${pv_version}"

setenv TTK_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"

prepend-path PV_PLUGIN_PATH "${prefix}/bin/plugins"
prepend-path PYTHONPATH "${pvpython_sitepackage_dir}"

if {![is-loaded boost]} {
    module load boost/1.73.0
}
