from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_data():
    """Define a route that returns JSON data."""
    sample_data = {
        "message": "Hello, this is your JSON data!",
        "status": "success",
        "data": {
            "item_id": 123,
            "item_name": "Sample Item",
            "quantity": 5
        }
    }
    return jsonify(sample_data)

if __name__ == '__main__':
    app.run(debug=True)