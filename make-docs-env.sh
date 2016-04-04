#!/bin/bash
export CONDA_ENV_NAME=doc-build
conda create -n $CONDA_ENV_NAME python=$TRAVIS_PYTHON_VERSION sphinx numpydoc pip jsonschema ipython matplotlib
# activate the environment to install some pip stuff
source activate $CONDA_ENV_NAME
pip install sphinx_bootstrap_teme sphinxcontrib-napoleon
# deactivate the environment after we're done
source deactivate
