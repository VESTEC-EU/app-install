#%Module
module-whatis "TTK version ${version} including Paraview ${pv_version}"

setenv TTK_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"

setenv VIRTUAL_ENV "${prefix}"
prepend-path PV_PLUGIN_PATH "${prefix}/bin/plugins"

# This is needed to ensure that TTK/Paraview work in another venv with
# this module loaded.
prepend-path PYTHONPATH "${pvpython_sitepackage_dir}"
# And this one is for numpy
prepend-path PYTHONPATH "${python_sitepackage_dir}"

if {![is-loaded boost]} {
    module load boost/1.73.0
}
