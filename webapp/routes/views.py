"""Routes for database views."""

from app import app
import queries.views as db
from collections import Counter
from flask import render_template, request, flash, redirect


@app.route("/workshop_department")
def workshop_department():
    coll_code = request.args.get("coll_code")
    if coll_code:
        data = db.workshop_department(coll_code)
        stats = Counter([row[6] for row in data])
    else:
        data = None
        stats = None
    return render_template("views/workshop_department.jinja",
                           coll_code=coll_code, data=data, stats=stats)


@app.route("/workshop_room")
def workshop_room():
    # TODO implement function stub
    data = db.workshop_room()
    return render_template("views/workshop_room.jinja", data=data)


@app.route("/volunteer_college")
def volunteer_college():
    # TODO implement function stub
    data = db.volunteer_college()
    return render_template("views/volunteer_college.jinja", data=data)


@app.route("/event_schedule")
def event_schedule():
    # TODO implement function stub
    data = db.event_schedule()
    return render_template("views/event_schedule.jinja", data=data)
