import socket

# Determine whether connecting from on/off campus
try:
    socket.gethostbyname("data.cs.jmu.edu")
    DSN = "host=data.cs.jmu.edu user=profs dbname=profs"
except socket.gaierror:
    DSN = "host=localhost user=profs dbname=profs"
