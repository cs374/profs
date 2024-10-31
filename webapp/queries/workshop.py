"""Queries for the Workshop table."""

from . import db_connect


def workshop_all():
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute('SELECT * FROM "Workshop"')
            return cur.fetchall()


def workshop_get(key):
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute('SELECT * FROM "Workshop" WHERE "ID" = %s', [key])
            return cur.fetchone()


def workshop_ins(values):
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute('INSERT INTO "Workshop" VALUES '
                        '(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', values)
            return cur.rowcount


def workshop_del(key):
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute('DELETE FROM "Workshop" WHERE "ID" = %s', [key])
            return cur.rowcount


if __name__ == "__main__":
    print("==== First 3 workshops ====")
    print(workshop_all()[:3])
