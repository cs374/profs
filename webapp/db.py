"""Database queries and functions."""

import psycopg
import socket

# Determine whether connecting from on/off campus
try:
    socket.gethostbyname("data.cs.jmu.edu")
    DSN = "host=data.cs.jmu.edu user=profs dbname=profs"
except socket.gaierror:
    DSN = "host=localhost user=profs dbname=profs"


def workshop_all():
    with psycopg.connect(DSN) as conn:
        with conn.cursor() as cur:
            cur.execute('SELECT * FROM "Workshop"')
            return cur.fetchall()


def workshop_get(key):
    with psycopg.connect(DSN) as conn:
        with conn.cursor() as cur:
            cur.execute('SELECT * FROM "Workshop" WHERE "ID" = %s', [key])
            return cur.fetchone()


def workshop_ins(values):
    with psycopg.connect(DSN) as conn:
        with conn.cursor() as cur:
            cur.execute('INSERT INTO "Workshop" VALUES '
                        '(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', values)
            return cur.rowcount


def workshop_del(key):
    with psycopg.connect(DSN) as conn:
        with conn.cursor() as cur:
            cur.execute('DELETE FROM "Workshop" WHERE "ID" = %s', [key])
            return cur.rowcount


if __name__ == "__main__":
    print("==== First 3 Workshops ====")
    print(workshop_all()[:3])
