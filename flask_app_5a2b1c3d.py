from flask import Flask

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_data():
    """
    A route that returns JSON data.
    """
    data = {
        "message": "Hello, this is your JSON data!",
        "status": "success",
        "data": {
            "id": 123,
            "name": "Sample Item",
            "value": 42
        }
    }
    return app.response_class(
        response=app.json.dumps(data),
        mimetype='application/json'
    )

if __name__ == '__main__':
    app.run(debug=True)