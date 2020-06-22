#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

git clone https://github.com/common-workflow-language/cwltool.git
git clone https://github.com/rupertnash/galaxy.git
