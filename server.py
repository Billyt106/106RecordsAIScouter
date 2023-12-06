from flask import Flask, request, jsonify, render_template
import threading
import /opt/render/project/src/backend
from flask_cors import CORS  # Import CORS
import os

app = Flask(__name__)
CORS(app)
@app.route('/')
def index():
    return render_template('/index.html')

@app.route('/opt/render/project/src/backend', methods=['POST'])
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
    # Set host to '0.0.0.0' to listen on all public IPs.
    # Set port to the environment variable PORT, or 5000 if it's not set.
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
