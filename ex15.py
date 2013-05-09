from sys import argv

script, filename = argv  # getting set to receive 1 thing on the command line, recall script is just the thing that you are running

txt = open(filename)

print "Here's your file %r:" % filename
# this next line is challenge to me. because are there many more thing for txt.(SOMETHING)  txt.write()
print txt.read()

print "Type the filename again:"
file_again = raw_input("> ")

txt_again = open(file_again)

print txt_again.read()


# What 
# Get rid of the part from line 10-15 where you use raw_input and try the script then.
