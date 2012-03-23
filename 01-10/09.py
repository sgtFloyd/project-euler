# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#     a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

import sys

def is_triplet(a,b,c):
  return a**2 + b**2 == c**2

def sums_up(a,b,c):
  return a+b+c == 1000

for a in xrange(1, 999):
  for b in xrange(a, 999):
    for c in xrange(b, 999):
      if sums_up(a, b, c):
        if is_triplet(a, b, c):
          print a*b*c
          sys.exit()

# => 31875000
# real    0m23.338s
# user    0m22.936s
# sys     0m0.085s