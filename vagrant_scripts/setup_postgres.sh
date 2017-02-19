#!/usr/bin/env bash

sudo -i -u postgres

createuser ramax
psql
ALTER USER ramax WITH PASSWORD 'ramax';
ALTER USER ramax CREATEDB;
\q # --exit psql

exit # --exit postgres


# psql -U postgres -c "CREATE USER ramax WITH CREATEUSER PASSWORD 'ramax';"
# psql -U postgres -c "ALTER USER ramax CREATEDB;"
