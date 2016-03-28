#!/bin/sh
export FS_HOST=localhost
export FS_DATABASE=test
mkdir -p ~/.config/filestore
ls ~/.config
ls ~/.config/filestore
echo "port: 27017" > ~/.config/filestore/connection.yml