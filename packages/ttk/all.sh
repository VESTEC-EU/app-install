#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
for step in download patch "pv/patch" "pv/configure" "pv/build" "pv/install" configure build install module; do
    $thisdir/$step.sh
done
