from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    sample_data = {
        "message": "Hello, this is your random data!",
        "status": "success",
        "data": {
            "id": 12345,
            "name": "Sample Item",
            "value": 99.99
        }
    }
    return jsonify(sample_data)

if __name__ == '__main__':
    app.run(debug=True)