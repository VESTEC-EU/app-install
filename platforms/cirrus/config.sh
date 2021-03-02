# Copy link this file (app-install/platforms/archer/config.sh)
# to top level of repo (app-intall/config.sh)
platform=cirrus

vestec=dc118

pub_app_dir=/lustre/home/shared/$vestec/sw
pub_mod_dir=/lustre/home/shared/$vestec/modules
pub_data_dir=/lustre/home/shared/$vestec/data

priv_app_dir=/lustre/home/$vestec/shared/sw
priv_mod_dir=/lustre/home/$vestec/shared/modules
priv_data_dir=/lustre/home/$vestec/shared/data

make_parallelism=16
