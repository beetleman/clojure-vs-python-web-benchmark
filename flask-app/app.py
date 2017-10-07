import time
from flask import (
    Flask,
    request
)


app = Flask(__name__)


def toInt(x):
    try:
        return int(x)
    except Exception:
        return 0


@app.route("/")
def hello():
    delay = request.args.get('delay')
    time.sleep(toInt(delay)/1000)
    return "Hello World!"
