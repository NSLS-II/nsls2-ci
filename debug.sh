#!/bin/sh
conda info -e
conda list
echo "UPLOAD_ONLY_IF_BRANCH_IS=$UPLOAD_ONLY_IF_BRANCH_IS"