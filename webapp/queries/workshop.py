"""Queries for the workshop table."""

from . import db_connect


def workshop_all():
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM workshop")
            return cur.fetchall()


def workshop_get(key):
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM workshop WHERE id = %s", [key])
            return cur.fetchone()


def workshop_ins(values):
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("INSERT INTO workshop VALUES "
                        "(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", values)
            con.commit()
            return cur.rowcount


def workshop_upd(key, values):
    raise NotImplementedError("workshop update not implemented")


def workshop_del(key):
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("DELETE FROM workshop WHERE id = %s", [key])
            con.commit()
            return cur.rowcount


if __name__ == "__main__":
    print("==== First 3 workshops ====")
    print(workshop_all()[:3])
