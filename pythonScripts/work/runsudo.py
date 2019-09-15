#!/usr/bin/python

from pysudoers import Sudoers


sobj = Sudoers(path="/home/pault/mysudoersfile")

for default in sobj.defaults:
	print(default)


