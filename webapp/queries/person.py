"""Queries for the Person table."""

from . import db_connect


def person_all():
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute('SELECT * FROM "Person"')
            return cur.fetchall()


def person_get(key):
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute('SELECT * FROM "Person" WHERE "Email" = %s', [key])
            return cur.fetchone()


def person_ins(values):
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute('INSERT INTO "Person" VALUES '
                        '(%s, %s, %s, %s, %s, %s)', values)
            return cur.rowcount


def person_upd(key, values):
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute('UPDATE "Person" SET "Email" = %s, "Type" = %s, '
                        '"FirstName" = %s, "LastName" = %s, "Phone" = %s, '
                        '"Department_Code" = %s WHERE "Email" = %s', values + [key])
            return cur.rowcount


def person_del(key):
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute('DELETE FROM "Person" WHERE "Email" = %s', [key])
            return cur.rowcount


if __name__ == "__main__":
    print("==== First 3 persons ====")
    print(person_all()[:3])
