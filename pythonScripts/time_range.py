#!/usr/bin/env python
import time

#use time.time() on Linux

start = time.clock()
print "start=%f" % start
for x in range(1000):
    pass
stop = time.clock()
print "range(1000)"

print stop-start
floatv = start-stop
print "floatv = %f" % floatv

print "stop=%f" % stop


start = time.clock()
print "start=%f" % start

for x in xrange(1000):
    pass
stop = time.clock()

print "xrange(1000)"

print stop-start
floatv = start-stop
print "floatv = %f" % floatv
print "stop=%f" % stop
