# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

require_relative '../euler.rb'; include Euler

puts sieve(2_000_000).inject(:+)

# => 142913828922
# real    0m1.198s
# user    0m1.170s
# sys     0m0.025s