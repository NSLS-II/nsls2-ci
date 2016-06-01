#!/bin/sh
unset BINSTAR_TOKEN
env
conda info -e
conda list
echo "UPLOAD_ONLY_IF_BRANCH_IS=$UPLOAD_ONLY_IF_BRANCH_IS"

cat ~/.condarc

mongod --version
