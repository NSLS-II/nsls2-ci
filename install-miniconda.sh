#!/bin/sh
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p ~/mc
# export conda into script environment
export PATH=~/mc/bin:$PATH
export CONDA_BUILD_COMMAND="conda-build conda-recipe --python=$TRAVIS_PYTHON_VERSION"
# install packages required for building and uploading. Install 1.18.1 for now because GIT_DESCRIBE is broken on 1.18.2
conda install --yes anaconda-client conda-build=1.18.1
# fetch a custom condarc for building and uploading to anaconda.org.
cp condarc ~/.condarc
# wget https://gist.githubusercontent.com/ericdill/960e933953eee6d428b0/raw/b468527d9eea692b1ca68263f7f59084f80ac3cc/.condarc -O ~/.condarc