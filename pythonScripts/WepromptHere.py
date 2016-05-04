#!/usr/bin/python

import sys

if sys.argv < 2:
	print('To few arguments, please specify a file name')
	exit()


print('Arguments:', len(sys.argv))
print('List:', str(sys.argv))

if sys.argv < 2:
	print('To few arguments, please specify a file name')

filename = sys.argv[1]
print ('Filename:', filename)

