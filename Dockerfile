FROM postgres:10.5

WORKDIR /

ENV VERSION=1018
ENV PGDATA=/database/data
ENV RELEASE=123

COPY create-db-data.sh /docker-entrypoint-initdb.d/init-db-data.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY postgresql.conf /database/data/postgresql.conf
