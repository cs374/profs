"""Queries for the person table."""

from . import db_connect


def person_all():
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM person")
            return cur.fetchall()


def person_get(key):
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM person WHERE email = %s", [key])
            return cur.fetchone()


def person_ins(values):
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("INSERT INTO person VALUES "
                        "(%s, %s, %s, %s, %s, %s)", values)
            con.commit()
            return cur.rowcount


def person_upd(key, values):
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("UPDATE person SET email = %s, type = %s, "
                        "first_name = %s, last_name = %s, phone = %s, "
                        "department_code = %s WHERE email = %s", values + [key])
            con.commit()
            return cur.rowcount


def person_del(key):
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("DELETE FROM person WHERE email = %s", [key])
            con.commit()
            return cur.rowcount


if __name__ == "__main__":
    print("==== First 3 persons ====")
    print(person_all()[:3])
