# Change this line to select which DBMS to use
DB = "mysql"


if DB == "mysql":

    import myloginpath
    import mysql.connector

    CNF = myloginpath.parse("cs374")

    def db_connect():
        """Connect to the database server."""
        return mysql.connector.connect(**CNF, database="profs")


if DB == "pgsql":

    import psycopg
    import socket

    # Determine whether connecting from on/off campus
    try:
        socket.gethostbyname("data.cs.jmu.edu")
        DSN = "host=data.cs.jmu.edu user=profs dbname=profs"
    except socket.gaierror:
        DSN = "host=localhost user=profs dbname=profs"

    def db_connect():
        """Connect to the database server."""
        return psycopg.connect(DSN)
