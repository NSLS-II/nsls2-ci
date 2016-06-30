#!/bin/sh
source activate root
git fetch --unshallow
conda install conda-build
export CONDA_BUILD_COMMAND="conda-build conda-recipe --python=$TRAVIS_PYTHON_VERSION"
if [[ ( "$TRAVIS_PYTHON_VERSION" != 'nightly' ) ]] ; then
  $CONDA_BUILD_COMMAND;
fi;
