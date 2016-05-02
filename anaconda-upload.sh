#!/bin/sh
# output some debug info
echo "ANACONDA_USER = $ANACONDA_USER"
echo "ANACONDA_CHANNEL = $ANACONDA_CHANNEL"
if [[ $UPLOAD_ONLY_IF_BRANCH_IS == "" ]]; then
  UPLOAD_ONLY_IF_BRANCH_IS="master";
fi;
# prepend the "-c" to the channel name if it is defined. Otherwise leave ANACONDA_CHANNEL undefined
if [[ $ANACONDA_CHANNEL ]]; then
  ANACONDA_CHANNEL="-c $ANACONDA_CHANNEL";
fi;
if [[ ( "$TRAVIS_PYTHON_VERSION" != 'nightly' ) && ( "$TRAVIS_PULL_REQUEST" == 'false' ) && ( "$TRAVIS_BRANCH" == $UPLOAD_ONLY_IF_BRANCH_IS ) ]] ; then
  anaconda -t ${BINSTAR_TOKEN} upload $($CONDA_BUILD_COMMAND --output) -u $ANACONDA_USER $ANACONDA_CHANNEL --force;
else;
  echo "Not uploading because this is either (1) python nightly, (2) a pull request or (3) not the $UPLOAD_ONLY_IF_BRANCH_IS branch"
fi;
