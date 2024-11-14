"""Routes for main functionality: workshop leader."""

from app import app
import queries.workshop_leader as db
from flask import render_template, request, flash, redirect


@app.route("/workshop_leader")
def workshop_leader():
    email = request.args.get("email")
    year = request.args.get("year")
    if email and year:
        data = db.workshop_get(email, year)
    else:
        data = None
        flash("No workshop found for this person.")
    return render_template("views/workshop_leader.jinja",
                           email=email, year=year, data=data)
