module load gcc/10.2.0
module load openssl/1.1.1d
export CC=gcc
export LD_RUN_PATH=$OPENSSL_DIR/lib
export LDFLAGS=-Wl,--enable-new-dtags
configure_other_args="--shared-openssl"
