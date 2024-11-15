"""Routes for main functionality: workshop leader."""

from app import app
import queries.workshop_leader as db
from flask import render_template, request, flash, redirect


@app.route("/workshop_leader")
def workshop_leader():
    # If the form was not submitted
    if not request.args:
        return render_template("functionality/workshop_leader.jinja")
    email = request.args.get("email")
    year = request.args.get("year")
    if email and year:
        return redirect("/workshop_leader/" + email + "/" + year)
    flash("Must enter both values.")
    return render_template("functionality/workshop_leader.jinja")



@app.route("/workshop_leader/<email>/<year>")
def workshop_leader_edit(email, year):
    # If the form was not submitted
    print(email, year, "HEY")
    if not request.args:
        data = db.workshop_get(email, year)
        if not data:
            flash("No workshop found for this person.")
            return redirect("/workshop_leader")
        data = ["" if v is None else v for v in data]
        return render_template("functionality/wl_edit.jinja",
                           email=email, year=year, data=data)

    # Update
    values = list(request.args.values())
    action = values.pop()
    try:
        if action == "Update":
            # integer values
            if values[3].strip() == "":
                values[3] = 0
            if values[6].strip() == "":
                values[6] = 0
            id = db.workshop_update(email, year, values)
            flash("Updated workshop #" + str(id))
    except Exception as e:
        flash(str(e))
        return render_template("functionality/wl_edit.jinja",
                           email=email, year=year, data=values)
    return redirect("/workshop_leader")
