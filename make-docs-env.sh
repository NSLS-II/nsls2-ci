#!/bin/bash
conda create -n doc-build python=$TRAVIS_PYTHON_VERSIONs sphinx numpydoc pip jsonschema ipython matplotlib
pip install sphinx_bootstrap_theme sphinxcontrib-napoleon
