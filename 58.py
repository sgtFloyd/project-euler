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

a = [False, False, True] # initial values
def sieve(n):
  global a; lower = len(a)
  if n+1 > lower:
    a += [True, False] * ((n-lower)/2+1)
  for i in xrange(3, int(math.sqrt(n)+1), 2):
    if a[i]:
      for j in [x for x in xrange(2*i, n+1, i) if x>=lower]:
        a[j] = False
  return [i for i, prime in enumerate(a) if prime]

def diagonals(size):
  return reduce(
          list.__add__,
          [ [ #(i+1)**2,      # bottom-right diagonal - never prime!
              i**2 + 1,       # upper-left diagonal
              i**2 + (i+1),   # bottom-left diagonal
              i**2 - (i-1) ]  # upper-right diagonal
            for i in range(2, size+1, 2)
          ] + [[1]]           # center 1
        )
