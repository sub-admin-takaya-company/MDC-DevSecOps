 from flask import Flask, request
 import sqlite3
 
 app = Flask(__name__)
 
 @app.route("/user")
 def get_user():
     username = request.args.get("name")
     conn = sqlite3.connect("test.db")
     # SQL インジェクション脆弱性（意図的）
     query = "SELECT * FROM users WHERE name = '" + username + "'"
     result = conn.execute(query)
     return str(result.fetchall())
