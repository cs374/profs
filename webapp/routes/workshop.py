"""Routes for viewing/editing workshops."""

from app import app
import queries.workshop as db
from flask import render_template, request, flash, redirect


@app.route("/workshops")
def workshop_all():
    data = db.workshop_all()
    return render_template("workshop_all.jinja", data=data)


@app.route("/workshops/<key>")
def workshop_edit(key):
    # If the form was not submitted (i.e., first visit)
    if not request.args:
        if key == "new":
            values = []
        else:
            values = db.workshop_get(key)
        return render_template("workshop_edit.jinja", key=key, values=values)

    # Perform the requested action
    values = list(request.args.values())
    action = values.pop()
    try:
        if action == "Insert":
            db.workshop_ins(values)
            flash("Workshop inserted")
        elif action == "Update":
            flash("Update not implemented")
        elif action == "Delete":
            key = request.args["ID"]
            db.workshop_del(key)
            flash("Workshop deleted")
    except Exception as e:
        flash(str(e))
        return render_template("workshop_edit.jinja", key=key, values=values)
    return redirect("/workshops")
