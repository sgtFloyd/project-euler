# The first two consecutive numbers to have
# two distinct prime factors are:
#
#   14 = 2 x 7
#   15 = 3 x 5
#
# The first three consecutive numbers to have
# three distinct prime factors are:
#
#   644 = 2^2 x 7 x 23
#   645 = 3 x 5 x 43
#   646 = 2 x 17 x 19
#
# Find the first four consecutive integers to
# have four distinct primes factors. What is
# the first of these numbers?

require_relative '../euler.rb'; include Euler

# memoize the previous 4 results, to avoid recalculation
n = 647; $last_four = [3, 3, 3, 1] # 644, 645, 646, 647
def uniq_factors(num)
  $last_four.shift
  $last_four.push prime_factors(num).uniq.count
end

n += 1 while uniq_factors(n) != [4, 4, 4, 4]
puts n-3

# => 134043
