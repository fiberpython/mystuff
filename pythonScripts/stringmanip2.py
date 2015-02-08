#!/usr/bin/python
sub1 = "python string!"
sub2 = "an arg"

a = "i am a %s"%sub1
b = "i am a {0}".format(sub1)

c = "with %(kwarg)s!"%{'kwarg':sub2}
d = "with {kwarg}!".format(kwarg=sub2)

print a
print b
print c
print d
