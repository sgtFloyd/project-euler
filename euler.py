import math, random

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



def miller_rabin(n):
  """ miller-rabin primality test """
  d = n - 1; s = 0
  while d % 2 == 0:
    d >>= 1; s += 1
  for a in potential_witnesses(n):
    if not witness(a, s, d, n):
      return False
  return True

def witness(a, s, d, n):
  """ test primality of n using a single witness """
  a_to_power = pow(a, d, n)
  if a_to_power == 1: return True
  for _ in xrange(s-1):
    if a_to_power == n-1: return True
    a_to_power = (a_to_power * a_to_power) % n
  return a_to_power == n-1

def potential_witnesses(n):
  """ allows deterministic miller-rabin results for values of n < 341,550,071,728,321 """
  if n < 1373653:         return [2, 3]                   # n < 1,373,653
  if n < 9080191:         return [31, 73]                 # n < 9,080,191
  if n < 4759123141:      return [2, 7, 61]               # n < 4,759,123,141
  if n < 2152302898747:   return [2, 3, 5, 7, 11]         # n < 2,152,302,898,747
  if n < 3474749660383:   return [2, 3, 5, 7, 11, 13]     # n < 3,474,749,660,383
  if n < 341550071728321: return [2, 3, 5, 7, 11, 13, 17] # n < 341,550,071,728,321
  return [random.randint(1,n-1) for _ in xrange(0,20)]    # 99.999999999909051% (1 - .25**20) accuracy for n >= 341,550,071,728,321

def solve_quad(a, b, c):
  """ solve for n: 0 = an^2 + bn + c """
  sqrt = math.sqrt(b**2 - 4*a*c)
  return ((-b + sqrt)/(2*a),
          (-b - sqrt)/(2*a))

def is_triangle(x):
  """ x = n(n+1)/2 => 0 = n^2 + n - 2x """
  solution = solve_quad(1, 1, -2*x)
  return max(solution) % 1 == 0

def is_pentagonal(x):
  """ x = n(3n-1)/2 => 0 = 3n^2 - n - 2x """
  solution = solve_quad(3, -1, -2*x)
  return max(solution) % 1 == 0

def is_hexagonal(x):
  """ x = n(2n-1) => 0 = 2n^2 - n - x """
  solution = solve_quad(2, -1, -x)
  return max(solution) % 1 == 0
