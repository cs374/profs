"""Queries for the Person table."""

from . import DSN
import psycopg


def person_all():
    with psycopg.connect(DSN) as conn:
        with conn.cursor() as cur:
            cur.execute('SELECT * FROM "Person"')
            return cur.fetchall()


def person_get(key):
    with psycopg.connect(DSN) as conn:
        with conn.cursor() as cur:
            cur.execute('SELECT * FROM "Person" WHERE "Email" = %s', [key])
            return cur.fetchone()


def person_ins(values):
    with psycopg.connect(DSN) as conn:
        with conn.cursor() as cur:
            cur.execute('INSERT INTO "Person" VALUES '
                        '(%s, %s, %s, %s, %s, %s)', values)
            return cur.rowcount


def workshop_del(key):
    with psycopg.connect(DSN) as conn:
        with conn.cursor() as cur:
            cur.execute('DELETE FROM "Person" WHERE "Email" = %s', [key])
            return cur.rowcount


if __name__ == "__main__":
    print("==== First 3 persons ====")
    print(person_all()[:3])
