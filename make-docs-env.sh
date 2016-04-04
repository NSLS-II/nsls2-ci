#!/bin/bash
export CONDA_ENV_NAME=doc-build
conda create -n $CONDA_ENV_NAME python=$TRAVIS_PYTHON_VERSIONs sphinx numpydoc pip jsonschema ipython matplotlib
pip install sphinx_bootstrap_theme sphinxcontrib-napoleon
