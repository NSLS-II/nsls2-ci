#!/bin/bash
set -e # exit with nonzero exit code if anything fails

source activate doc-build

make clean
make html

source deactivate
