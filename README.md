# VESTEC application install scripts

These modules are compatible with ARCHER2 for now. They should be simple enough to adapt to other machines by providing a new set of platform-specific
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
- `source app-install/modules.sh`
- `app-install/paraview/install_pv.sh`
- `app-install/sampling/install_sampling.sh`
- `app-install/ipicmini/install_ipicmini.sh`
- `app-install/ttk/install_ttk.sh`

## Known issue 1 - Paraview superbuild fails
The first execution of the Paraview superbuild script, will raise the following error:

`clang-10: error: unsupported option '--unresolved-symbols=ignore-in-shared-libs'`

Since the fix needs to be applied to a file that is downloaded by the superbuild script itself, to solve this you need to manually patch the following file: 

`paraview-build/superbuild/paraview/src/VTK/Utilities/Python/CMakeLists.txt`

From the root folder of your repository simply call the following command:

`cp app-install/paraview/superbuild_patch/CMakeLists.txt paraview-build/superbuild/paraview/src/VTK/Utilities/Python/`

## Known issue 2 - Paraview superbuild fails to link properly all libraries

After the patch the superbuild completes the compilation process for all enabled modules, but it lastly fails to link properly all libraries, raising the following error:

`RuntimeError: Unable to find the libunwind.so.1 library`

Since `libunwind` is installed correctly in Archer2, but as `libunwind.so.8`, we need to create symlink to "fix" the version number.
From the root folder of your repository simply call the following command:

`ln -s /usr/lib64/libunwind.so.8 $PWD/paraview-build/install/lib/libunwind.so.1`

## Open issue (to do)
Only the above mentioned modules are currently compatible with ARCHER2. 
