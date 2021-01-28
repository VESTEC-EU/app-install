module load python
module load gcc/6.3.0
module load openssl

export CC=gcc
export configure_other_args="--shared-openssl"
