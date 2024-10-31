"""Routes for viewing/editing the Person table."""

from app import app
import queries.person as db
from flask import render_template, request, flash, redirect


@app.route("/person")
def person_all():
    data = db.person_all()
    return render_template("person_all.jinja", data=data)


@app.route("/person/<key>")
def person_edit(key):

    # If the form was not submitted
    if not request.args:
        if key == "new":
            values = []
        else:
            values = db.person_get(key)
        return render_template("person_edit.jinja", key=key, values=values)

    # Perform the requested action
    values = list(request.args.values())
    action = values.pop()
    try:
        if action == "Insert":
            db.person_ins(values)
            flash("Person inserted")
        elif action == "Update":
            db.person_upd(key, values)
            flash("Person updated")
        elif action == "Delete":
            db.person_del(key)
            flash("Person deleted")
    except Exception as e:
        flash(str(e))
        return render_template("person_edit.jinja", key=key, values=values)
    return redirect("/person")
