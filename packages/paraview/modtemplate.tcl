#%Module
module-whatis "ParaView-$version server (Catalyst edition)"

if {![is-loaded python]} {
    module load python/3.8.5
}

${python_layer_venv}

setenv PARAVIEW_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
setenv PARAVIEW_VERSION "${version}"
