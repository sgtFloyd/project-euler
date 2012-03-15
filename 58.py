# Starting with 1 and spiralling anticlockwise in the following way,
# a square spiral with side length 7 is formed.
# 
#   37 36 35 34 33 32 31
#   38 17 16 15 14 13 30
#   39 18  5  4  3 12 29
#   40 19  6  1  2 11 28
#   41 20  7  8  9 10 27
#   42 21 22 23 24 25 26
#   43 44 45 46 47 48 49
# 
# It is interesting to note that the odd squares lie along the bottom
# right diagonal, but what is more interesting is that 8 out of the 13
# numbers lying along both diagonals are prime; that is, a ratio of 8/13 = 62%.
# 
# If one complete new layer is wrapped around the spiral above, a square spiral
# with side length 9 will be formed. If this process is continued, what is the
# side length of the square spiral for which the ratio of primes along both
# diagonals first falls below 10%?

import math
primes = [False, False, True] # initial values
def sieve(n): # memoized, optimized sieve of eratosthenes
  global primes; lower = len(primes)
  if n+1 > lower:
    # extend storage, even #s are automatically non-prime
    primes += [True, False] * ((n-lower)/2+1)
  for i in xrange(3, int(math.sqrt(n)+1), 2):
    if primes[i]:
      for j in [x for x in xrange(3*i, n+1, 2*i) if x>=lower]:
        primes[j] = False
  # return [i for i, is_prime in enumerate(primes) if is_prime]

def diagonals(size):
  return reduce(
          list.__add__,
          [ [ #(i+1)**2,      # bottom-right diagonal - never prime!
              i**2 + 1,       # upper-left diagonal
              i**2 + (i+1),   # bottom-left diagonal
              i**2 - (i-1) ]  # upper-right diagonal
            for i in xrange(2, size+1, 2)
          ] #+ [[1]]          # center 1 - never prime!
        )

def is_prime(n):
  if n < 999985: return primes[n] # use cache
  if n%2 == 0 or n%3 == 0 or n%5 == 0 or n%7 == 0: return False
  return miller_rabin(n)


import random

def miller_rabin(n):
  # compute s and d
  d = n - 1; s = 0
  while d % 2 == 0:
    d >>= 1; s += 1
  for a in a_vals(n):
    if not miller_rabin_pass(a, s, d, n):
      return False
  return True

def miller_rabin_pass(a, s, d, n):
  a_to_power = pow(a, d, n)
  if a_to_power == 1: return True
  for _ in xrange(s-1):
    if a_to_power == n - 1: return True
    a_to_power = (a_to_power * a_to_power) % n
  return a_to_power == n - 1

# deterministic for values < 341,550,071,728,321
def a_vals(n):
  if n < 1373653:         return [2, 3]                   # n < 1,373,653
  if n < 9080191:         return [31, 73]                 # n < 9,080,191
  if n < 4759123141:      return [2, 7, 61]               # n < 4,759,123,141
  if n < 2152302898747:   return [2, 3, 5, 7, 11]         # n < 2,152,302,898,747
  if n < 3474749660383:   return [2, 3, 5, 7, 11, 13]     # n < 3,474,749,660,383
  if n < 341550071728321: return [2, 3, 5, 7, 11, 13, 17] # n < 341,550,071,728,321
  return [random.randint(1,n-1) for _ in xrange(0,20)]

def prime_percent(spiral_size):
  return sum([is_prime(d)
                for d in diagonals(spiral_size)
            ]) / (2*spiral_size-1.0) # ensure float

sieve(999983) # cache prime numbers 0 - 999,983
i=26501
while True:
  i += 2
  pp = prime_percent(i)
  print "%s: %s" % (str(i), str(pp))