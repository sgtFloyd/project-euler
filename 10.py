# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

def sieve(n):
  a = [True]*(n+1)
  a[0] = a[1] = False
  for i in xrange(n/2+1):
    if a[i]:
      for j in xrange(2*i, n+1, i):
        a[j] = False
  return [i for i, prime in enumerate(a) if prime]

print reduce(lambda sum, i: sum + i, sieve(2000000))

# => 142913828922
# real    0m0.787s
# user    0m0.766s
# sys     0m0.018s