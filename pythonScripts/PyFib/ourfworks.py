import time
import math

def is_prime_v1(n):
  """ Return 'True' if 'n' is a prime number. False otherwise. """
  if n == 1:
    return False  # 1 is not prime

  for d in range(2,n):
    if n % d == 0:
      return False
    return True

# ===== Time Funcion =======
def is_prime_v2(n):
    """ Return 'True' if 'n' is a prime number. False otherwise."""
    if n == 1:
        return False  # 1 is not prime

    max_divisor = math.floor(math.sqrt(n))
    for d in range(2, 1 + max_divisor):
        if n % d == 0:
            return False
    return True

# ===== Test Function  =====
for n in range(1,200):
    print(n,is_prime_v1(n))






    #t0 = time.time()
    #for n in range(1,100000):
    #    is_prime_v1(n)
    #t1 = time.time()
    #print("Time required: ", t1 - t0)
