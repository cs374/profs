import socket

# Change this line to select which DBMS to use
DBMS = "mysql"

# Determine whether connecting from on/off campus
try:
    socket.gethostbyname("data.cs.jmu.edu")
    HOST = "data.cs.jmu.edu"
except socket.gaierror:
    HOST = "localhost"


if DBMS == "mysql":

    import myloginpath
    import mysql.connector

    CNF = myloginpath.parse("profs")

    def db_connect():
        """Connect to the database server."""
        return mysql.connector.connect(host=HOST, port="3306", **CNF, database="profs")


if DBMS == "pgsql":

    import psycopg

    def db_connect():
        """Connect to the database server."""
        return psycopg.connect(host=HOST, port="5432", user="profs", dbname="profs")
