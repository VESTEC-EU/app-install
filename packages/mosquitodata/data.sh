#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

REMOTE_HOST=ftp.dlr.de
REMOTE_USER=VESTEC
REMOTE_PASSWORD=$1
REMOTE_DIR=datasets/diseases/input_files

set -x
# Ensure that if this is the first version installed, others can also
# write the package dir
mkdir_gw $app_dir/$name
mkdir_gw $prefix

pushd $prefix

wanted_files="florida/lm_covariates_florida_not_filtered.csv
florida/wc_temp_florida.csv
rome/IDS_rome.pkl
rome/lm_covariates_rome_not_filtered.csv
rome/MASCHERA_rome.pkl
rome/wc_temp_rome.csv
trento/IDS_trento.pkl
trento/lm_covariates_trento_not_filtered.csv
trento/MASCHERA_trento.pkl
trento/wc_temp_trento.csv"

# Which files don't we have?
missing_files=
for f in $wanted_files; do
    if [ ! -f $f ]; then
	missing_files="$missing_files $f"
    fi
done

# Create any missing directories for ftp
for f in $missing_files; do
    d=`dirname $f`
    if [ ! -d $d ]; then
	mkdir_gw $d
    fi
done

# If there are any missing, get via FTP
if [ ${#missing_files} -gt 0 ]; then
    # Get the missing files
    ftp -in $REMOTE_HOST <<EOF
user $REMOTE_USER $REMOTE_PASSWORD
cd $REMOTE_DIR
mget $missing_files
bye
EOF
fi

popd
