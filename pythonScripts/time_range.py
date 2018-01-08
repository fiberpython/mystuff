#!/usr/bin/env python
import time

#use time.time() on Linux

start = time.clock()

for x in range(1000):
    pass
stop = time.clock()

print "range(1000)"

print stop-start

start = time.clock()
for x in xrange(1000):
    pass
stop = time.clock()

print "xrange(1000)"

print stop-start
