from flask import Flask, request, jsonify, render_template
import threading
import backend
from flask_cors import CORS  # Import CORS

app = Flask(__name__)
CORS(app)
@app.route('/')
def index():
    return render_template('/index.html')

@app.route('/backend', methods=['POST'])
def run_script():
    try:
        data = request.json
        insta_username = data.get('insta_username')
        password = data.get('password')

        if not insta_username or not password:
            return jsonify({"message": "Username or password missing"}), 400

        thread = threading.Thread(target=backend.main, args=(insta_username, password))
        thread.start()
        return jsonify({"message": "Script started"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
