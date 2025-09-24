from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    sample_data = {
        "status": "success",
        "data": {
            "item1": "value1",
            "item2": 42,
            "item3": ["a", "b", "c"]
        }
    }
    return jsonify(sample_data)

if __name__ == '__main__':
    app.run(debug=True)
