import cmds
import os

from flask import Flask, render_template, redirect, abort
app = Flask(__name__, template_folder="templates")

# Register controllers
app.register_blueprint(cmds.user_path, url_prefix = "/user")

@app.errorhandler(404)
def page_not_found(e):
    # Custom error page
    return render_template("404.html"), 404

@app.route("/redirect")
def arbitrary_redirect():
    return redirect("/", code=302)

@app.route("/admin")
def admin():
    abort(403)

@app.route("/")
def index():
    return render_template("index.html")

if __name__ == "__main__":
    # Allows port to be set with `PORT=5000 python app.py`
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port, debug=True)