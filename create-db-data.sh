#!/bin/bash

set -o errexit

PROFILE=/vault/secrets/config

[ -f $PROFILE ] && source $PROFILE

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
