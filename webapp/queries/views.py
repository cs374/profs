"""Queries for database views."""

from . import db_connect


def workshop_department(coll_code):
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM workshop_department "
                        "WHERE college_code = %s", [coll_code])
            return cur.fetchall()


def workshop_room():
    # TODO implement function stub
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM workshop_room")
            return cur.fetchall()


def volunteer_college():
    # TODO implement function stub
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM volunteer_college")
            return cur.fetchall()


def event_schedule():
    # TODO implement function stub
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM event_schedule")
            return cur.fetchall()
