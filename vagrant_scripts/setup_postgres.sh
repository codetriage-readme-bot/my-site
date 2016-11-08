#!/usr/bin/env bash

sudo -i -u postgres

# psql -U postgres -c "CREATE USER ramax WITH CREATEUSER PASSWORD 'ramax';"
# psql -U postgres -c "ALTER USER ramax CREATEDB;"

# createuser vagrant
# psql
# CREATE USER ramax WITH CREATEUSER PASSWORD 'ramax';
# ALTER USER ramax CREATEDB;
# \q --exit psql
# exit


sudo -u postgres createuser -s -d ramax
# echo 'ramax'
exit
