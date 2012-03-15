import math

primes = [False, False, True] # initial values
def sieve(n):
  """ memoized, optimized sieve of eratosthenes """
  global primes; lower = len(primes)
  if n+1 > lower:
    primes += [True, False] * ((n-lower)/2+1)
  for i in xrange(3, int(math.sqrt(n)+1), 2):
    if primes[i]:
      for j in xrange(3*i, n+1, 2*i):
        if j >= lower:
          primes[j] = False
  return [i for i, is_prime in enumerate(primes) if is_prime]



import random
# http://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test
# http://en.literateprograms.org/Miller-Rabin_primality_test_%28Python%29
def miller_rabin_pass(a, s, d, n):
  a_to_power = pow(a, d, n)
  if a_to_power == 1: return True
  for _ in xrange(s-1):
    if a_to_power == n - 1: return True
    a_to_power = (a_to_power * a_to_power) % n
  return a_to_power == n - 1

def miller_rabin(n):
  """ miller-rabin primality test """
  d = n - 1; s = 0
  while d % 2 == 0:
    d >>= 1; s += 1
  for a in a_vals(n):
    if not miller_rabin_pass(a, s, d, n):
      return False
  return True

# deterministic for values of n < 341,550,071,728,321
def a_vals(n):
  """ allows deterministic results from miller-rabin """
  if n < 1373653:         return [2, 3]                   # n < 1,373,653
  if n < 9080191:         return [31, 73]                 # n < 9,080,191
  if n < 4759123141:      return [2, 7, 61]               # n < 4,759,123,141
  if n < 2152302898747:   return [2, 3, 5, 7, 11]         # n < 2,152,302,898,747
  if n < 3474749660383:   return [2, 3, 5, 7, 11, 13]     # n < 3,474,749,660,383
  if n < 341550071728321: return [2, 3, 5, 7, 11, 13, 17] # n < 341,550,071,728,321
  return [random.randint(1,n-1) for _ in xrange(0,20)]