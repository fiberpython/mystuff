#!/usr/local/bin/python

from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def hello():
    name = request.args.get('name', 'world')
    return f'Hello {name}!'
    