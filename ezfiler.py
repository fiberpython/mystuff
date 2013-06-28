import os
import commands
import sys

def Cat(filename):
	f = open(filename)
	text = f.read()
	print '---', filename
	print text

# Define a main() function that prints a little greeting.
def main():
	args = sys.argv[1:]
	for arg in args:
		Cat(arg)


# This is the standard boilerplate that calls the main() function.

if __name__ == '__main__':
	main()
	
