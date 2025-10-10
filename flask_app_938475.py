from flask import Flask
import json

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    sample_data = {
        "message": "Hello, this is your JSON data!",
        "status": "success",
        "data": {
            "item_id": 12345,
            "item_name": "Sample Item",
            "quantity": 10
        }
    }
    return json.dumps(sample_data), 200, {'Content-Type': 'application/json'}

if __name__ == '__main__':
    app.run(debug=True)