#!/usr/local/bin/python2

str= "qA2"

print any(c.isalnum() for c in str)
print any(c.isalpha() for c in str)
print any(c.isdigit() for c in str)
print any(c.islower() for c in str)
print any(c.isupper() for c in str)

