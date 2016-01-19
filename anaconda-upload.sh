#!/bin/sh
echo "ANACONDA_USER = $ANACONDA_USER"
echo "ANACONDA_CHANNEL = $ANACONDA_CHANNEL"
if [[ ( "$TRAVIS_PYTHON_VERSION" != 'nightly' ) && ( "$TRAVIS_PULL_REQUEST" == 'false' ) && ( "$TRAVIS_BRANCH" == 'auto-build-on-travis' ) ]] ; then
  anaconda -t ${BINSTAR_TOKEN} upload $($CONDA_BUILD_COMMAND --output) -u $ANACONDA_USER $ANACONDA_CHANNEL --force;
fi;