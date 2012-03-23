# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

require_relative '../euler.rb'; include Euler

puts (10..50_000).select{|i|
  i.to_s.split('').inject(0){|sum, n| sum + factorial(n.to_i)} == i
}.inject(:+)

# => 40730
# real    0m0.267s
# user    0m0.263s
# sys     0m0.004s
