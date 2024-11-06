"""Queries for database views."""

from . import db_connect


def workshop_department():
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM workshop_department")
            return cur.fetchall()


def workshop_room():
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM workshop_room")
            return cur.fetchall()


def volunteer_college():
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM volunteer_college")
            return cur.fetchall()


def event_schedule():
    with db_connect() as con:
        with con.cursor() as cur:
            cur.execute("SELECT * FROM event_schedule")
            return cur.fetchall()