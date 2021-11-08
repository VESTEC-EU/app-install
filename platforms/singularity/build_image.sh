#!/bin/bash

pkg_name=$1

singularity build cwl.sif platforms/singularity/$pkg_name/Singularity

