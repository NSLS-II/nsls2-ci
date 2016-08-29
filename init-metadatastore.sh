#!/bin/sh
export MDS_HOST=localhost
export MDS_DATABASE=mds-test
export MDS_TIMEZONE=US/Eastern
export MDS_MONGO_USER=tom
export MDS_MONGO_PWD=jerry
mkdir -p ~/.config/metadatastore
ls ~/.config
ls ~/.config/metadatastore
echo "port: 27017" > ~/.config/metadatastore/connection.yml
