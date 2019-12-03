from flask import Flask, jsonify, request
from flask_cors import CORS

import mysql.connector

db = mysql.connector.connect(
    host='localhost',
    user='root',
    passwd='',
    database='berita'
)

app = Flask('berita-service')
CORS(app)


@app.route('/getBerita', methods=['GET'])
def index():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM getBerita")
    getBerita = cursor.fetchall()
    return jsonify(getBerita)


@app.route('/getBerita/<id_berita>', methods=['GET'])
def show(id_berita):
    cursor = db.cursor(dictionary=True)
    cursor.execute('SELECT * FROM getBerita WHERE id_berita='+id_berita)
    getBerita = cursor.fetchall()
    return jsonify(getBerita[0])


@app.route('/addBerita', methods=['POST', 'GET'])
def create():
    getBerita = request.get_json()
    cursor = db.cursor(dictionary=True)
    query = 'INSERT INTO getBerita (id_berita, title, author, category, isi_berita) VALUES ("%s", "%s", "%s","%s", "%s")' % (
        getBerita['id_berita'], getBerita['title'], getBerita['author'], getBerita['category'], getBerita['isi_berita'])
    cursor.execute(query)
    return jsonify({'message': 'success', 'data': getBerita})


app.run(port=8001, debug=True)
