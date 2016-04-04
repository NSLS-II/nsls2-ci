#!/bin/bash
set -e # exit with nonzero exit code if anything fails

source activate $CONDA_ENV_NAME

make clean
make html

source deactivate
