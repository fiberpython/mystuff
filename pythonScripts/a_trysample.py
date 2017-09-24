	
Disclaimer: I have been exposed to a significant amount of F77

The modern equivalent of goto (arguable, only my opinion, etc) is explicit exception handling:

	Edited to highlight the code reuse better.

	Pretend pseudocode in a fake python-like language with goto:

		def myfunc1(x)
		    if x == 0:
			            goto LABEL1
				        return 1/x

				def myfunc2(z)
				    if z == 0:
					            goto LABEL1
						        return 1/z

						myfunc1(0) 
						myfunc2(0)

						:LABEL1
						print 'Cannot divide by zero'.
						Compared to python:

							def myfunc1(x):
								    return 1/x

							    def myfunc2(y):
								        return 1/y


								try:
									    myfunc1(0)
									        myfunc2(0)
								except ZeroDivisionError:
									    print 'Cannot divide by zero'


