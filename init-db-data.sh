#!/bin/bash

set -o errexit

PROFILE=/vault/secrets/config

if [ -f $PROFILE ]; then
    source $PROFILE
else
    POSTGRES_USER=postgres
    POSTGRES_PASSWORD=mydbpass
    export POSTGRES_USER POSTGRES_PASSWORD
fi

psql -v ON_ERROR_STOP=1 -U $POSTGRES_USER <<-EOF
    CREATE DATABASE posts;
    \connect posts;
    CREATE TABLE textData (
        id    SERIAL PRIMARY KEY,
        title TEXT,
        text  TEXT
    );
    INSERT INTO textData (title, text) VALUES ('title', 'text');
EOF
