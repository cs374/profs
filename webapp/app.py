"""Web app for madiSTEM Workshop Management."""

import os
from flask import Flask, render_template, send_from_directory

app = Flask(__name__)
app.secret_key = "dev"  # required for flash()


@app.route("/")
def index():
    return render_template("index.jinja")


@app.route("/favicon.ico")
def favicon():
    # See https://flask.palletsprojects.com/en/stable/patterns/favicon/
    return send_from_directory(os.path.join(app.root_path, "static"),
                               "favicon.ico", mimetype="image/vnd.microsoft.icon")


# Import all routes from other modules
import routes
