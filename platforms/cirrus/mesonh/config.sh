module load mpt
module load intel-compilers-19
module load hdf5parallel/1.10.6-intel19-mpt222
module load ncl
module load gcc

# MNH config variables
export VER_MPI=MPIAUTO
export ARCH=LXifort
export OPTLEVEL=O2
export CC=gcc
export CXX=g++
export VERSION_NCL=6.6.2
export NEED_NCARG=NO
