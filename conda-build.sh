#!/bin/sh
source activate root
conda install conda-build
if [[ ( "$TRAVIS_PYTHON_VERSION" != 'nightly' ) ]] ; then
  $CONDA_BUILD_COMMAND;
fi;
