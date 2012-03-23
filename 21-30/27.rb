# Euler published the remarkable quadratic formula:
#
#   n^2 + n + 41
#
# It turns out that the formula will produce 40 primes
# for the consecutive values n = 0 to 39. However, when
# n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is divisible
# by 41, and certainly when n = 41, 41^2 + 41 + 41 is
# clearly divisible by 41.
#
# Using computers, the incredible formula  n^2 - 79n + 1601
# was discovered, which produces 80 primes for the consecutive
# values n = 0 to 79. The product of the coefficients, -79 and
# 1601, is -126479.
#
# Considering quadratics of the form:
#
#   n^2 + an + b, where |a| < 1000 and |b| < 1000
#
# where |n| is the modulus/absolute value of n
#   e.g. |11| = 11 and |-4| = 4
#
# Find the product of the coefficients, a and b, for the
# quadratic expression that produces the maximum number of
# primes for consecutive values of n, starting with n = 0.

require_relative '../euler.rb'; include Euler

def eval_quad(n, a, b)
  n**2 + a*n + b
end

def is_prime?(n)
  return false if n < 2
  sieve(n) unless n < $primes.length
  return $primes[n]
end

max_n = 0; max_pair = [0,0]
(-1000..1000).each do |a|
  (-1000..1000).each do |b|
    n = 0
    n += 1 while is_prime? eval_quad(n, a, b)
    (max_n = n; max_pair = [a,b]) if n > max_n
  end
end

puts max_pair.inject(:*)

# => -59231
# real    0m1.178s
# user    0m1.170s
# sys     0m0.008s
