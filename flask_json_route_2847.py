from flask import Flask, jsonify
import json

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """A route that returns JSON data"""
    sample_data = {
        "message": "Hello from Flask!",
        "status": "success",
        "data": {
            "users": [
                {"id": 1, "name": "Alice", "email": "alice@example.com"},
                {"id": 2, "name": "Bob", "email": "bob@example.com"},
                {"id": 3, "name": "Charlie", "email": "charlie@example.com"}
            ],
            "total_count": 3
        }
    }
    return jsonify(sample_data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({"message": "Welcome to the Flask JSON API!"})

if __name__ == '__main__':
    app.run(debug=True)