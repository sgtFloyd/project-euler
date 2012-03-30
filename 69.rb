# Euler's Totient function, phi(n), is used to determine the
# number of numbers less than n which are relatively prime to
# n. For example, as 1, 2, 4, 5, 7, and 8, are all less than
# nine and relatively prime to nine, phi(9)=6.
#
#   n  Relatively Prime phi(n)  n/phi(n)
#   2   1                 1       2
#   3   1,2               2       1.5
#   4   1,3               2       2
#   5   1,2,3,4           4       1.25
#   6   1,5               2       3
#   7   1,2,3,4,5,6       6       1.1666...
#   8   1,3,5,7           4       2
#   9   1,2,4,5,7,8       6       1.5
#   10  1,3,7,9           4       2.5
#
# It can be seen that n=6 produces a maximum n/phi(n) for n <= 10.
#
# Find the value of n <= 1,000,000 for which n/phi(n) is a maximum.

require './euler.rb'; include Euler

base = 2; multiplier = 1; last_prime = base
n=base*multiplier; max_n = n, max_phi = n/phi(n)
while n <= 1_000_000
  # keep track of max phi
  n = (base*multiplier).to_f; phi_n = n/phi(n)
  if phi_n > max_phi
    max_n = n; max_phi = phi_n
  end

  # count by multiplieriples of the product of primes
  multiplier += 1
  if multiplier > last_prime && prime_factors(multiplier) == [multiplier]
    base *= multiplier; last_prime = multiplier; multiplier = 1
  end
end

puts max_n.to_i

# => 510510
# real    0m0.012s
# user    0m0.009s
# sys     0m0.003s
