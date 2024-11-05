# This script rebuilds the entire database.
#
# Run this command to create a login path for storing the password:
# mysql_config_editor set --login-path=profs -u profs -p

export CMD='mysql --login-path=profs --local-infile -s -h 127.0.0.1 -P 3306 profs'

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
