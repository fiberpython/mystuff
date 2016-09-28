def fib(n):
    if n <= 1:
        return 1
    else:
       return fib(n-1) + fib(n-2)

def memoize(f):
    def memf(*x):
        if x not in memf.cache:
            memf.cache[x] = f(*x)
        return memf.cache[x]
    memf.cache = {}
    return memf

fib = memoize(fib)
print fib(7)


