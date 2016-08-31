#!/bin/sh
export FS_HOST=localhost
export FS_DATABASE=fs-test
export FS_PORT=27017
export FS_MONGO_USER=tom
export FS_MONGO_PWD=jerry
mkdir -p ~/.config/filestore
ls ~/.config
ls ~/.config/filestore
echo "host: localhost" > ~/.config/filestore/connection.yml
echo "port: 27017" > ~/.config/filestore/connection.yml
echo "mongo_user: tom" > ~/.config/filestore/connection.yml
echo "mongo_pwd: jerry" > ~/.config/filestore/connection.yml
