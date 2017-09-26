#!/usr/bin/python

def foo(n):
	for x in range(n):
		yield x**3

for x in foo(5):
	print x,


