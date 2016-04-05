#!/bin/bash
# early exit if we are not in the right part of the matrix
if [[ $TRAVIS_BRANCH != $BUILD_DOCS_BRANCH ]] || \
   [[ $TRAVIS_PULL_REQUEST != 'false' ]] || \
   [[ $BUILD_DOCS != 'true' ]]; then
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
    export CONDA_ENV_NAME=doc-build
    conda create -n $CONDA_ENV_NAME python=$TRAVIS_PYTHON_VERSION sphinx numpydoc pip jsonschema ipython matplotlib
    # activate the environment to install some pip stuff
    source activate $CONDA_ENV_NAME
    pip install sphinx_bootstrap_theme sphinxcontrib-napoleon
    # deactivate the environment after we're done
    source deactivate
fi
