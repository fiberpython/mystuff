#!/usr/local/bin/python

from argparse import ArgumentParser

def main():
    ap = ArgumentParser()
    ap.add_argument('name', nargs='?')
    args = ap.parse_args()
    name = (args.name or 'World')
    print "Hello,", name, "!"

main()

# sample output
# BLUEMAC:~ bssg$ /Users/bssg/mystuff/py3/SimpleArg.py
# Hello, World !
# BLUEMAC:~ bssg$ /Users/bssg/mystuff/py3/SimpleArg.py pablo
# Hello, pablo !
# BLUEMAC:~ bssg$

# Look at this there is built in help


# BLUEMAC:~ bssg$ /Users/bssg/mystuff/py3/SimpleArg.py --help
# usage: SimpleArg.py [-h] [name]

# positional arguments:
#   name

# optional arguments:
#   -h, --help  show this help message and exit
# BLUEMAC:~ bssg$

