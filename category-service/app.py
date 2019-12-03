from flask import Flask, jsonify, request
from flask_cors import CORS

import mysql.connector

db = mysql.connector.connect(
    host='localhost',
    user='root',
    passwd='',
    database='portalberita'
)

app = Flask('berita-service')
CORS(app)


@app.route('/', methods=['GET'])
def index():
    cursor = db.cursor(dictionary=True)
    cursor.execute(
        "SELECT berita.title, berita.author, category.category, berita.isi_berita FROM berita JOIN category ON berita.id_berita = category.id_category")
    berita = cursor.fetchall()
    return jsonify(berita)


@app.route('/<id_berita>', methods=['GET'])
def show(id_berita):
    cursor = db.cursor(dictionary=True)
    cursor.execute('SELECT * FROM berita WHERE id_berita='+id_berita)
    berita = cursor.fetchall()
    return jsonify(berita[0])


@app.route('/add', methods=['POST'])
def create():
    berita = request.get_json()
    cursor = db.cursor(dictionary=True)
    query = 'INSERT INTO berita (id_berita, title, author, isi_berita) VALUES ("%s", "%s", "%s", "%s")' % (
        berita['id_berita'], berita['title'], berita['author'], berita['isi_berita'])
    print(query)
    cursor.execute(query)
    return jsonify({'message': 'success', 'data': berita})


@app.route('/category', methods=['GET'])
def category():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM category")
    category = cursor.fetchall()
    return jsonify(category)


@app.route('/detailBerita', methods=['GET'])
def detailBerita():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT b.title, b.author, c.category, b.isi_berita, d.detailBerita FROM berita b JOIN category c ON b.id_berita=c.id_category JOIN detailBerita d ON c.id_category=b.id_berita")
    detailBerita = cursor.fetchall()
    return jsonify(detailBerita)


app.run(port=8000, debug=True)
