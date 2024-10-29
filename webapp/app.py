"""Web app for madiSTEM Workshop Management."""

from flask import Flask, render_template, request, flash, redirect
import db

app = Flask(__name__)
app.secret_key = "dev"  # required for flash()


@app.route("/")
def index():
    return render_template("index.jinja")


@app.route("/workshops")
def workshop_all():
    data = db.workshop_all()
    return render_template("workshop_all.jinja", data=data)


@app.route("/workshops/<key>")
def workshop_edit(key):

    if request.args:
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

    # Form was not submitted
    if key == "new":
        values = []
    else:
        values = db.workshop_get(key)
    return render_template("workshop_edit.jinja", key=key, values=values)
