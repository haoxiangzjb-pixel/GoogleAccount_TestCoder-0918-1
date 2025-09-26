from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_data():
    sample_data = {
        "message": "Hello from the API!",
        "status": "success",
        "data": {
            "user": "flask_user",
            "id": 12345,
            "active": True
        }
    }
    return jsonify(sample_data)

if __name__ == '__main__':
    app.run(debug=True)