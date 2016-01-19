#!/bin/sh
if [[ ( "$TRAVIS_PYTHON_VERSION" != 'nightly' ) ]] ; then
  $CONDA_BUILD_COMMAND; 
fi;