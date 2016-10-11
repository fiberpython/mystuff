def myfunc1(x):
    return 1/x

def myfunc2(y):
    return 1/y


try:
    myfunc1(0)
    myfunc2(0)
except ZeroDivisionError:
    print 'Cannot divide by zero'