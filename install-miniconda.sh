#!/bin/sh
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
chmod +x miniconda.sh
./miniconda.sh -b -p ~/mc
cat "export PATH=~/mc/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
# clean up after thyself
rm miniconda.sh
