import random, subprocess

x=int(random.uniform(7, 18))

k=int(random.uniform(19, 38))
ans = k - x
print "\n %d - %d = %d" % (k,x,ans)
thewrit ="""  say %d minus %d """ % (k,x)
print thewrit
# print "Ans = %d", ans

# Format expression That is 1 dead bird!
# call([arg])
uname = "say"
uname_arg = str(k)
subprocess.call([uname, uname_arg])
subprocess.call(["say", "minus"])

uname_argx = str(x)
subprocess.call([uname, uname_argx])

# subprocess.call(["say", "%d"])
