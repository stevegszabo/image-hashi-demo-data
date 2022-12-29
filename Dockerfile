FROM postgres:15.1

WORKDIR /

ENV PGDATA=/database/data

COPY init-db-data.sh /docker-entrypoint-initdb.d/init-db-data.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY postgresql.conf /database/data/postgresql.conf
