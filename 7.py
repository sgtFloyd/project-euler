# By listing the first six prime numbers:
#     2, 3, 5, 7, 11, and 13
# we can see that the 6th prime is 13.
#
# What is the 10,001st prime number?

TARGET = 10001

# Sieve of Eratosthenes
#    Input: an integer n > 1
#
#    Let A be an array of Boolean values, indexed by integers 2 to n,
#    initially all set to true.
#
#    for i = 2, 3, 4, ..., while i <= n/2:
#      if A[i] is true:
#        for j = 2i, 3i, 4i, ..., while j <= n:
#          A[j] := false
#
#    Now all i such that A[i] is true are prime.
def sieve(n):
  a = [True]*(n+1)
  a[0] = a[1] = False
  for i in xrange(n/2+1):
    if a[i]:
      for j in xrange(2*i, n+1, i):
        a[j] = False
  return [i for i, prime in enumerate(a) if prime]

n = TARGET; primes = sieve(n)
while len(primes) < TARGET:
  n *= 2; primes = sieve(n)

print primes[TARGET-1]

# => 104743
# real    0m0.109s
# user    0m0.100s
# sys     0m0.007s