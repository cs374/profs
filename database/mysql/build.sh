# This script rebuilds the entire database.
#
# Run the following command to create the login path and store the password:
# mysql_config_editor set --login-path=cs374 -h data.cs.jmu.edu -u profs -p

export CMD='mysql --login-path=cs374 --local-infile profs'

echo Dropping tables...
$CMD < drop.sql

echo Creating tables...
$CMD < create.sql

echo Adding comments...
$CMD < comment.sql

echo Loading data...
$CMD < load.sql

echo Adding constraints...
$CMD < alter.sql
