
x = 'X-DSPAM-Confidence:   0.8475'
print x
pos = x.find(':')
print pos
print x[pos+1:]
num = float(x[pos+1:])
print num, type(num)

