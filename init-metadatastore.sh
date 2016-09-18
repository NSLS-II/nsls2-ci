#!/bin/sh
export MDS_HOST=localhost
export MDS_DATABASE=mds-test
export MDS_TIMEZONE=US/Eastern
export MDS_MONGO_USER=tom
export MDS_MONGO_PWD=jerry
export MDS_PORT=27017
mkdir -p ~/.config/metadatastore
ls ~/.config
ls ~/.config/metadatastore
echo "host: localhost" > ~/.config/metadatastore/connection.yml
echo "port: 27017" >> ~/.config/metadatastore/connection.yml
echo "mongo_user: tom" >> ~/.config/metadatastore/connection.yml
echo "mongo_pwd: jerry" >> ~/.config/metadatastore/connection.yml
