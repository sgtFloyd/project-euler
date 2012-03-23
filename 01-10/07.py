# By listing the first six prime numbers:
#     2, 3, 5, 7, 11, and 13
# we can see that the 6th prime is 13.
#
# What is the 10,001st prime number?
import math

TARGET = 10001

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

n = TARGET; pnums = sieve(n)
while len(pnums) < TARGET:
  n *= 2; pnums = sieve(n)

print pnums[TARGET-1]

# => 104743
# real    0m0.056s
# user    0m0.048s
# sys     0m0.007s