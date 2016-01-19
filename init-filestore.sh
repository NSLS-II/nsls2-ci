#!/bin/sh
export FS_HOST=localhost
export FS_DATABASE=test
mkdir -p /home/travis/.config/filestore
'echo ''port: 27017'' > /home/travis/.config/filestore/connection.yml'