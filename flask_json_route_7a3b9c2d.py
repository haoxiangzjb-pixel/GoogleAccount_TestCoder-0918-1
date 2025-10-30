from flask import Flask, jsonify
import random
import string

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_json_data():
    """
    A Flask route that returns JSON data
    """
    # Sample JSON data
    data = {
        'id': random.randint(1, 100),
        'name': 'Sample Data',
        'description': 'This is a sample JSON response from Flask',
        'items': [
            {'item_id': 1, 'name': 'Item 1'},
            {'item_id': 2, 'name': 'Item 2'},
            {'item_id': 3, 'name': 'Item 3'}
        ],
        'status': 'success'
    }
    return jsonify(data)

@app.route('/', methods=['GET'])
def home():
    """
    Home route
    """
    return jsonify({'message': 'Welcome to the Flask JSON API!'})

if __name__ == '__main__':
    app.run(debug=True)