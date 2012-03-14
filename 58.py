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
    a += [True, False] * int(math.ceil((n+1-lower+1)/2))
  for i in xrange(3, int(math.sqrt(n)+1), 2):
    if a[i]:
      # TODO: filter upon range construction, instead
      for j in filter(lambda x: x>=lower, xrange(2*i, n+1, i)):
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

print "100: %s" % sieve(100)
print "101: %s" % sieve(101)
print "102: %s" % sieve(102)
#print "103: %s" % sieve(103)
#print "105: %s" % sieve(105)
#print "106: %s" % sieve(106)
#print "108: %s" % sieve(108)
#print "201: %s" % sieve(201)
#print "203: %s" % sieve(203)
#print "209: %s" % sieve(209)
print "210: %s" % sieve(210)