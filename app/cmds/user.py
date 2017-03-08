from flask import Blueprint, render_template

user_path = Blueprint("user", __name__, template_folder="templates")
url_prefix = "/user"

@user_path.route("/<username>", methods=["GET"])
def index(username):
    # http://flask.pocoo.org/docs/0.12/quickstart/#variable-rules
    return "User %s" % username