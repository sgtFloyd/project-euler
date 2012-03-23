# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include leading zeros.)

require './euler.rb'; include Euler

puts (1...1_000_000).select{|n| palindrome?(n) && palindrome?(n.base(2))}.inject(:+)

# => 872187
