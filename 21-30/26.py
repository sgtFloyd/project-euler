# A unit fraction contains 1 in the numerator. The decimal representation
# of the unit fractions with denominators 2 to 10 are given:
#
#       1/2   = 0.5
#       1/3   = 0.(3)
#       1/4   = 0.25
#       1/5   = 0.2
#       1/6   = 0.1(6)
#       1/7   = 0.(142857)
#       1/8   = 0.125
#       1/9   = 0.(1)
#       1/10  = 0.1
#
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It
# can be seen that 1/7 has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest recurring
# cycle in its decimal fraction part.

import math, sys

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

# Fermat's Little Theorem says:
#
#   1/d has a cycle of n digits if 10n-1 mod d = 0 for prime d
#
# It also follows that a prime number in the denominator, d, can yield up
# to d-1 repeating decimal digits. We need to find the largest prime, p,
# under 1000 that has p-1 digits.

for d in sieve(1000)[::-1]:
  c = 1
  while (10**c - 1) % d != 0: c += 1
  if d-c == 1: print d; sys.exit()

# => 983
# real    0m0.025s
# user    0m0.018s
# sys     0m0.006s