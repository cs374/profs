# This script rebuilds the entire database.
#
# Run the following command to create the login path and store the password:
# mysql_config_editor set --login-path=cs374 -h 127.0.0.1 -P 3306 -u profs -p

export CMD='mysql --login-path=cs374 --local-infile profs'

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
