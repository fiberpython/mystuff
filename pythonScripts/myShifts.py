def shifts(a, b):
    print " "
    print "CALCULATE %s + (2 x %s) to bring you" % (a, b)
    return int(a) + (int(b)*2)

print "how many shifts have you worked?"
print " "

singles = raw_input('singles?')
doubles = raw_input('doubles?')

print "you've worked", shifts(singles, doubles), "shifts."


