#!/bin/bash

# early exit if we are not in the right part of the matrix
if [[ $TRAVIS_BRANCH != $BUILD_DOCS_BRANCH ]] || \
   [[ $TRAVIS_PULL_REQUEST != 'false' ]] || \
   [[ $BUILD_DOCS == 'false' ]]; then
  echo "
    This script is not going to push the docs because you are on the

        TRAVIS_BRANCH=$TRAVIS_BRANCH
        BUILD_DOCS_BRANCH=$BUILD_DOCS_BRANCH

    branch (You need to be on $BUILD_DOCS_BRANCH to push) or this travis
    script is being run on a pull request

        TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST

    or BUILD_DOCS is set to false

        BUILD_DOCS=$BUILD_DOCS

    If any of those conditions are not true, then this travis script
    will not build the docs

        ${GH_REF}
"
else
  . make-docs.sh
  . push-docs.sh
fi;
