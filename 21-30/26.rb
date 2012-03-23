# A unit fraction contains 1 in the numerator. The decimal representation
# of the unit fractions with denominators 2 to 10 are given:
#
#       1/2   = 0.5
#       1/3   = 0.(3)
#       1/4   = 0.25
#       1/5   = 0.2
#       1/6   = 0.1(6)
#       1/7   = 0.(142857)
#       1/8   = 0.125
#       1/9   = 0.(1)
#       1/10  = 0.1
#
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It
# can be seen that 1/7 has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest recurring
# cycle in its decimal fraction part.

require_relative '../euler.rb'; include Euler

# Fermat's Little Theorem says:
#
#   1/d has a cycle of n digits if 10n-1 mod d = 0 for prime d
#
# It also follows that a prime number in the denominator, d, can yield up
# to d-1 repeating decimal digits. We need to find the largest prime, p,
# under 1000 that has p-1 digits.

sieve(1000).reverse.each do |d|
  c = 1
  c += 1 while (10**c - 1) % d != 0
  (puts d; exit) if d-c == 1
end

# => 983
# real    0m0.013s
# user    0m0.009s
# sys     0m0.003s
