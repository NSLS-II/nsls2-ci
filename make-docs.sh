#!/bin/bash
: "${DOCS_DIR:?DOCS_DIR not set. Do not know where to go to build the docs}"

message () {
  echo "
    message: $1
  "
}
# message "Setting the conda environment name"
# export CONDA_ENV_NAME=doc-build

# message "Creating the conda environment for building docs"
message "Installing conda dependencies to build the docs"
conda install -c lightsource2 sphinx numpydoc pip jsonschema ipython matplotlib $DOCS_CONDA_DEPS

# message "activating the sphinx build environment"
# source activate $CONDA_ENV_NAME

message "Installing pip dependencies for building the docs"
pip install sphinx_bootstrap_theme sphinxcontrib-napoleon $DOCS_PIP_DEPS

message "pushd'ing into DOCS_DIR=$DOCS_DIR"
pushd $DOCS_DIR

message "Making the docs with 'make html'"
make clean
make html

message "Returning to previous directory=`pwd`"
popd

# message "deactivating the conda environment"
# source deactivate
