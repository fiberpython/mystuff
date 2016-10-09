
def echo5():
	print "This number is divisible by 5"
def echo3():
	print "This number is divisible by 3"


for i in range(100):
	# i = i + 1
    if i == 0:
    	print "oops we have a Zero here"
    	break
	if i % 3 == 0:
		echo3()
		print "Fizz >> %d" % i
	
	if i % 5 == 0:
		echo5()
		print "Buzz >> %d" % i
