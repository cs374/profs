"""Routes for database views."""

from app import app
import queries.views as db
from flask import render_template, request, flash, redirect


@app.route("/workshop_department")
def workshop_department():
    dept_code = "CS"
    data = db.workshop_department(dept_code)
    return render_template("views/workshop_department.jinja", data=data)


@app.route("/workshop_room")
def workshop_room():
    data = db.workshop_room()
    return render_template("views/workshop_room.jinja", data=data)


@app.route("/volunteer_college")
def volunteer_college():
    data = db.volunteer_college()
    return render_template("views/volunteer_college.jinja", data=data)


@app.route("/event_schedule")
def event_schedule():
    data = db.event_schedule()
    return render_template("views/event_schedule.jinja", data=data)
