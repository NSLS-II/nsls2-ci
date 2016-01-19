#!/bin/sh
source deactivate
if [[ ( "$TRAVIS_PYTHON_VERSION" != 'nightly' ) ]] ; then
  $CONDA_BUILD_COMMAND; 
fi;