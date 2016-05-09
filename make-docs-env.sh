#!/bin/bash
export CONDA_ENV_NAME=doc-build
TRAVIS_PYTHON_VERSION=${TRAVIS_PYTHON_VERSION:=3.5}
conda create -n $CONDA_ENV_NAME python=$TRAVIS_PYTHON_VERSION sphinx numpydoc pip jsonschema ipython matplotlib
# activate the environment to install some pip stuff
source activate $CONDA_ENV_NAME
pip install sphinx_bootstrap_theme sphinxcontrib-napoleon
# deactivate the environment after we're done
cd $DOCS_DIR
make html
source deactivate
