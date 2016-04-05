#!/bin/bash
# early exit if we are not in the right part of the matrix
if [[ $TRAVIS_BRANCH != $BUILD_DOCS_BRANCH ]] || \
   [[ $TRAVIS_PULL_REQUEST != 'false' ]] || \
   [[ $BUILD_DOCS == 'true' ]]; then
  echo "
    This script is not going to push the docs because you are on the

        $TRAVIS_BRANCH

    branch (You need to be on $BUILD_DOCS_BRANCH to push) or this travis
    script is being run on a pull request

        $TRAVIS_PULL_REQUEST

    If either of those two conditions are not true, then this travis script
    will not push to

        ${GH_REF}
"
else
  set -e # exit with nonzero exit code if anything fails

  source activate $CONDA_ENV_NAME

  make clean
  make html

  source deactivate
fi
