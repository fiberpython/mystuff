#!/usr/bin/env python
import time

#use time.time() on Linux

print "Who is faster range or xrange"
print " "
start = time.clock()
for x in range(10000000):
    pass
stop = time.clock()
print "This is range(10000000)"

print stop - start
print " "

start = time.clock()
for x in xrange(10000000):
    pass
stop = time.clock()
print "This is xrange(10000000)"

print stop - start
print " "
