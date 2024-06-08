from flask import Blueprint, request, render_template, session, url_for, redirect, flash
import mysql.connector

# Tạo Blueprint cho module
appOrther = Blueprint('appTeacher', __name__, static_folder='../statics')

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="",
    database="danhgia"
)

mycursor = mydb.cursor()