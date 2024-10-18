# This script rebuilds the entire database.

export PGHOST=data.cs.jmu.edu
export PGDATABASE=profs
export PGUSER=profs

echo Dropping tables...
psql < drop.sql

echo Creating tables...
psql < create.sql

echo Adding comments...
psql < comment.sql

echo Adding constraints...
psql < alter.sql
