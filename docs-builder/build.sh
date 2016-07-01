#!/bin/bash

set -e

BUILD_DIR=/tmp/$LOGNAME/docs
NEW_DOCS_REPO=$BUILD_DIR/new_docs
CONDA_DIR=$BUILD_DIR/conda
URL_BASE="https://github.com/nsls-ii"
DOC_LOGS=$BUILD_DIR/logs
CONDA_DEPS="bluesky databroker sphinx matplotlib ipython jsonschema sphinx pip python=3.5 nslsii_dev_configuration ophyd collection tqdm"
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
mkdir -p $DOC_LOGS
rm -rf $NEW_DOCS_REPO
mkdir -p $NEW_DOCS_REPO
pushd $BUILD_DIR


# set up the condarc

echo "channels:
- lightsource2-dev
- lightsource2-tag
- conda-forge
- defaults
show_channel_urls: true
allow_softlinks: false
always_yes: true
binstar_upload: false
track_features:
- nomkl" > condarc

export CONDARC="$BUILD_DIR/condarc"

# if [ -e $CONDA_DIR ]; then
#   source activate $CONDA_DIR
#   conda install $CONDA_DEPS
# else
#   conda create -p $CONDA_DIR $CONDA_DEPS
#   source activate $CONDA_DIR
# fi;
rm -rf $CONDA_DIR
conda create -p $CONDA_DIR $CONDA_DEPS
source activate $CONDA_DIR
which conda
pip install sphinxcontrib-napoleon

# make the base docs
if [ -e docs ]; then
  pushd docs
  git remote update
  git reset --hard origin/master
  popd
else
  git clone $URL_BASE/docs
fi;
pushd docs
make html 2>&1 | tee $DOC_LOGS/docs.build.log
cp build/html/* $NEW_DOCS_REPO -r
popd

# make the docs for the rest of the projects
for git_repo in bluesky databroker datamuxer hklpy ophyd suitcase
do
  echo $git_repo
  if [ -e $git_repo ]; then
    pushd $git_repo
    git remote update
    git reset --hard origin/master
    popd
  else
    git clone $URL_BASE/$git_repo
  fi;
  pushd $git_repo/doc
  make html 2>&1 | tee $DOC_LOGS/$git_repo.build.log
  target=$NEW_DOCS_REPO/$git_repo
  mkdir -p $target
  cp build/html/* $target -r
  popd
done

pushd $NEW_DOCS_REPO
touch .nojekyll
git init
git add .
git commit -m "Regenerated docs on `date` at `uname`" --author "Dr. Builder <nomail@bnl.gov>"
git remote add origin git@github.com:nsls-ii/nsls-ii.github.io.git
git push origin master -f
