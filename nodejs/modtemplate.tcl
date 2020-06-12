#%Module
module-whatis "Node.JS"

setenv NODEJS_DIR "${nodejs_prefix}"
prepend-path PATH $$env(NODEJS_DIR)/bin
prepend-path MANPATH $$env(NODEJS_DIR)/share/man
