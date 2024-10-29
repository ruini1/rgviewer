from flask import Flask, jsonify
app = Flask(__name__)

@app.route('/api/hello', methods=['GET'])
def hello():
    return jsonify({"message": "Hello, world!"})

@app.route('/api/data', methods=['GET'])
def get_data():
    return jsonify({"data": {"id": 1, "name": "Sample Item"}})

if __name__ == '__main__':
    app.run(debug=True)
    print("running")

# http://127.0.0.1:5000/api/hello