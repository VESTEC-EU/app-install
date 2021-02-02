# Copy link this file (app-install/platforms/archer/config.sh)
# to top level of repo (app-intall/config.sh)
platform=archer2

vestec=d170

pub_app_dir=/home/$vestec/shared/sw
pub_mod_dir=/home/$vestec/shared/modules
pub_data_dir=/work/$vestec/shared/data

priv_app_dir=/home/$vestec/$vestec/shared/sw
priv_mod_dir=/home/$vestec/$vestec/shared/modules
priv_data_dir=/work/$vestec/$vestec/shared/data

make_parallelism=16

# Disable the pager for modules output cos it messes with the scripts
export MODULES_PAGER=""
