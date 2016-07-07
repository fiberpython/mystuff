
def outer(x):
	y = x * 2
	def inner(z):
		return y + z
	return inner

q = outer(5)
r = outer(9)

print q(2)

print q(3)


print r(2)


print r(3)


