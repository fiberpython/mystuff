#!/usr/local/bin/python

import compago
app = compago.Application()

@app.command
def greet(to="world"):
    print "Hello,", to, "!"

@app.command
def ungreet(to="world"):
    print "Goodbye,", to, "!"

if __name__ == '__main__': app.run()






# BLUEMAC:~ bssg$ /Users/bssg/mystuff/py3/simplecompago.py greet --to=Pablo
# Hello, Pablo !
# BLUEMAC:~ bssg$ /Users/bssg/mystuff/py3/simplecompago.py greet
# Hello, world !
# BLUEMAC:~ bssg$ /Users/bssg/mystuff/py3/simplecompago.py ungreet
# Goodbye, world !
# BLUEMAC:~ bssg$

    