# VESTEC application install scripts

These work on ARCHER2 and Cirrus for now. They should be simple enough
to adapt to other machines by providing a new set of platform-specific
config files.

To use these, you must create a top-level config.sh file, for example
by symlinking to the appropriate one in `platform/<platform name>/config.sh`.

## Using packages

An appropriate `module use` command is needed first. See the platform
config files for the `pub_mod_dir` and `priv_mod_dir` variables.

Then run `module use $pub_mod_dir $priv_mod_dir`

VESTEC modules can then be loaded/unloaded in the usual way.

## Installing packages

Change to the package directory you want to build

Create a build directory (e.g. `build` - git will ignore any directory starting with this) and change into it

Either:

Run `../all.sh`

Or:

Run each step individually (useful if debugging or moving to a new platform).

## Package setup

Each *package* (i.e. an application or library) has its own directory
in the `packages` folder. This should contain:
 - `env.sh` - package setup and machine-idependent configuration
 - `all.sh` - script to do entire process
 - `download.sh` - get the source and unpack
 - `configure.sh` - prepare for compilation (run configure script/CMake/etc)
 - `build.sh` - compile the package
 - `install.sh` - install the package to its destination (ensuring correct permissions so other VESTEC users can modify!)
 - `module.sh` - create a module file (check permissions as above)

Most of the scripts, except `env.sh` and `download.sh` can be symlinks
to one of the generic build systems (autotools, cmake, or pip). Module
creation can be automated by a simple `envsubst` template in
`modtemplate.tcl` in either the package directory or in the platform's
dir corresponding to the package.

### Env config script `env.sh`

This should:

1. source the top-level `env.sh` file

2. define package variables (`visibility`, `name`, `version`)

3. call `installer_init`

4. (optionally) define package specific/build system specific
variables that are independent of the *platform* (i.e. which machine
we're installing on).

## Plaform setup

Every machine has its quirks and different software/modules/etc.

First, each platform has a general configuration file in
`platforms/$name/config.sh` which sets some variables:

- `platform`: the name of the platform

- `vestec`: the name of the group

- Two sets of directories which are either public (readable by any
  user of the machine - prefix `pub_`) or private (readable only by
  members of the VESTEC project - prefix `priv_`). Directories tell
  the installers where to put applications (`app_dir`), module files
  (`mod_dir`) and data (`data_dir`).

- `make_parallelism`: the default number of parallel jobs to use when
  compiling (if the build system/step supports this)

- Any other variables useful (e.g. `MODULES_PAGER` is set to "" on
  ARCHER2 to workaround TCL module's incorrect understanding of when a
  shell is interactive or not.

Then for each package that is used on that platform, there should be a
folder containing a file `config.sh`, which contains anything needed
by that package on that machine, such as particular versions of
compilers/libraries to be loaded.

You can also add a platform-specific `modtemplate.tcl` file which will
override any in the package directory.
