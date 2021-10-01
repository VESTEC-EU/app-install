#%Module
module-whatis "Paraview Sampling Plugins created for Veste-WP3 activities, version ${version}"

setenv SAMPLING_DIR "${prefix}"
setenv LD_LIBRARY_PATH "${prefix}/lib:$LD_LIBRARY_PATH"
setenv PV_PLUGIN_PATH "${prefix}/lib/paraview-5.9/plugins/VestecPlugins"
# setenv PATH "$PATH:${prefix}/bin"

