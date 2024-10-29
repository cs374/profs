"""Queries for the workshop table."""

from . import DSN
import psycopg


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
