"""Web app for madiSTEM Workshop Management."""

from flask import Flask, render_template

app = Flask(__name__)
app.secret_key = "dev"  # required for flash()


@app.route("/")
def index():
    return render_template("index.jinja")


# Import the routes in other modules
import routes
