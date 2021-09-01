#%Module
module-whatis "Topological analysis of mosquito data version ${version}"

setenv MOSQUITO_TOPO_DIR "${prefix}"

module load python/3.8.5
module load ttk/0.9.9

setenv MOSQUITO_TOPO_DIR "${prefix}"
${python_layer_venv}
prepend-path PATH "${prefix}/bin"
