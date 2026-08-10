import os

from flask import Flask, render_template
import redis

app = Flask(__name__)

redis_host = os.getenv("REDIS_HOST", "redis")
redis_port = int(os.getenv("REDIS_PORT", 6379))

db = redis.Redis(
    host=redis_host,
    port=redis_port,
    decode_responses=True
)


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/count")
def count():
    visits = db.incr("visits")
    return render_template("count.html", visits=visits)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)