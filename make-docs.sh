#!/bin/bash
: "${DOCS_SUBDIR:?DOCS_SUBDIR not set. Do not know where to go to build the docs}"

message () {
  echo "
    message: $1
  "
}
# message "Setting the conda environment name"
# export CONDA_ENV_NAME=doc-build

# message "Creating the conda environment for building docs"
message "Installing conda dependencies to build the docs"
conda install sphinx numpydoc pip jsonschema ipython matplotlib $DOCS_CONDA_DEPS

# message "activating the sphinx build environment"
# source activate $CONDA_ENV_NAME

message "Installing pip dependencies for building the docs"
pip install sphinx_rtd_theme sphinxcontrib-napoleon $DOCS_PIP_DEPS

message "TRAVIS_BUILD_DIR=$TRAVIS_BUILD_DIR"
message "DOCS_SUBDIR=$DOCS_SUBDIR"
message "`pwd`"
message "pushd'ing into $DOCS_SUBDIR"
pushd ${DOCS_SUBDIR}
message "`pwd`"

message "Making the docs with 'make html'"
ls
make clean
make html
ret=$?
message "Returning to previous directory"
popd
return $ret
# message "deactivating the conda environment"
# source deactivate
