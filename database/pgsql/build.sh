# This script rebuilds the entire database.
#
# Create a pgpass file in your home directory for storing the password.
# See https://www.postgresql.org/docs/16/libpq-pgpass.html for details.

export CMD='psql -h data.cs.jmu.edu -U profs profs'

echo Dropping tables...
$CMD < drop.sql

echo Creating tables...
$CMD < create.sql

echo Adding comments...
$CMD < comment.sql

echo Adding constraints...
$CMD < alter.sql
