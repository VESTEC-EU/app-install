module load gcc/10.1.0
module load cmake/3.18.4
module load sqlite/3.34.1

cmake_vars[CMAKE_C_COMPILER]=`which gcc`
cmake_vars[CMAKE_CXX_COMPILER]=`which g++`

cmake_vars[SQLITE3_INCLUDE_DIR]=$SQLITE_DIR/include
cmake_vars[SQLITE3_LIBRARY]=$SQLITE_DIR/lib/libsqlite3.so
