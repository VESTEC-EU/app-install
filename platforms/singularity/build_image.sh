#!/bin/bash

pkg_name=$1

sudo singularity build cwl.sif platforms/singularity/$pkg_name/Singularity

