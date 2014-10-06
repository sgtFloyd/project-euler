# There are exactly ten ways of selecting three from five, 12345:
# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
# In combinatorics, we use the notation, 5C3 = 10.
# In general, nCr = n!/r!(n−r)! where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.

# How many, not necessarily distinct, values of nCr, for 1 ≤ n ≤ 100, are
# greater than one-million?

require_relative '../euler.rb'; include Euler

puts (23..100).inject(0){|sum, n|
  sum + (1..n).count{|r| n.choose(r) > 1_000_000}
}

# => 4075
# real    0m0.087s
# user    0m0.057s
# sys     0m0.028s
