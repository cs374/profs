# This script rebuilds the entire database.
#
# Create a pgpass file in your home directory for storing the password.
# See https://www.postgresql.org/docs/16/libpq-pgpass.html for details.

export CMD='psql -q -h localhost -U profs profs'

echo Dropping tables...
$CMD < drop.sql

echo Creating tables...
$CMD < create.sql

echo Adding comments...
$CMD < comment.sql

echo Loading data...
$CMD < load.sql

echo Generating data...
python generate.py

echo Adding constraints...
$CMD < alter.sql

echo Creating views...
$CMD < views.sql
