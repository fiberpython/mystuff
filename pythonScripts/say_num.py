import random, subprocess

# make random numbers

k=int(random.uniform(19, 38))
x=int(random.uniform(7, 18))

# convert numbers to strings
uname = "say"
uname_argk = str(k)
uname_argx = str(x)

# Do the math and format the output

ans = k - x
print "\n %d - %d = %d" % (k,x,ans)
thewrit ="""  say %d minus %d """ % (k,x)

print thewrit

subprocess.call([uname, uname_argk])
subprocess.call([uname, "minus"])
subprocess.call([uname, uname_argx])


