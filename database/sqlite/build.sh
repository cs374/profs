# This script rebuilds the entire database.
#
# No additional config is needed, except for to install sqlite3.
# An advantage of SQLite is being able to run without a network.

export CMD='sqlite3 ../profs.sqlite'

echo Dropping tables...
$CMD < drop.sql

echo Creating tables...
$CMD < create.sql

# echo Adding comments...
# $CMD < comment.sql

echo Loading data...
$CMD < load.sql

echo Generating data...
python generate.py

# echo Adding constraints...
# $CMD < alter.sql

echo Creating views...
$CMD < views.sql
