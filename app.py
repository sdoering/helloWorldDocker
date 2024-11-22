# app.py
from flask import Flask, send_file

app = Flask(__name__)

@app.route('/')
def hello():
    return send_file('index.html')

@app.route('/up')
def health():
    return '', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)