# VESTEC application install scripts

These work on ARCHER2 for now. They should be simple enough to adapt to other machines by providing a new set of platform-specific
config files. In ARCHER2 the defaults environment `cpe-cray` is used, and the only modules added are `cmake` and `boost`.

## How to install

To try the DLR-sampling features you need to compile the following packages:
- paraview (v5.9)
- sampling
- ipicmini
- (optional) TTK (v0.9.9)

First, clone the repository

`git clone -b feature/dlr-sampling git@github.com:VESTEC-EU/app-install.git`

After cloning the repository, simply call sequentially the following commands:
- `app-install/paraview/install_pv.sh`
- `app-install/sampling/install_sampling.sh`
- `app-install/ipicmini/install_ipicmini.sh`
- `app-install/ttk/install_ttk.sh`

## Known issue 1 - Paraview superbuild fails
The first execution of the Paraview superbuild script, will raise the following error:

`clang-10: error: unsupported option '--unresolved-symbols=ignore-in-shared-libs'`

Since the fix needs to be applied to file that is downloaded by the script itself, to solve this you need to manually patch the following file: 

`paraview-build/superbuild/paraview/src/VTK/Utilities/Python/CMakeLists.txt`

From the root folder of your repository simply call the following command:

`cp app-install/paraview/superbuild_patch/CMakeLists.txt paraview-build/superbuild/paraview/src/VTK/Utilities/Python/`

## Known issue 2 - Paraview superbuild fails to link properly all libraries

After the patch the superbuild completes the compilation process for all enabled modules, but it lastly fails to link properly all libraries.
Then, in the `install` does not contains all - `.so` files. There is not a working workaround (yet), but for profiling purposes we are copying all `.so` files from `paraview-build/install/lib/` to `install/ipicmini/lib/`. We added this `cp` command in `app-install/paraview/install_pv.sh`.

## Open issue (to do)
Only the above mentioned modules are currently compatible with ARCHER2. 
