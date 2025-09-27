from flask import Flask, jsonify
import random
import string

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    return jsonify({
        'message': 'Hello, this is your JSON data!',
        'status': 'success',
        'id': ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    })

if __name__ == '__main__':
    app.run(debug=True)
