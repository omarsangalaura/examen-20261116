import os
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/api/saludo", methods=["GET"])
def index():
    return jsonify("Hola Mundo")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)