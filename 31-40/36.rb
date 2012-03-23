# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include leading zeros.)

require_relative '../euler.rb'; include Euler

puts (1...1_000_000).select{|n| palindrome?(n) && palindrome?(n.base(2))}.inject(:+)

# => 872187
# real    0m0.827s
# user    0m0.821s
# sys     0m0.006s