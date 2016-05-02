#!/bin/sh
source activate root
git fetch --unshallow
conda install conda-build
if [[ ( "$TRAVIS_PYTHON_VERSION" != 'nightly' ) ]] ; then
  $CONDA_BUILD_COMMAND;
fi;
