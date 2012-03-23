# A perfect number is a number for which the sum of its proper divisors is exactly
# equal to the number. For example, the sum of the proper divisors of 28 would be
# 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than n
# and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number
# that can be written as the sum of two abundant numbers is 24. By mathematical
# analysis, it can be shown that all integers greater than 28123 can be written as
# the sum of two abundant numbers. However, this upper limit cannot be reduced any
# further by analysis even though it is known that the greatest number that cannot
# be expressed as the sum of two abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum of
# two abundant numbers.

require_relative '../euler.rb'; include Euler

LIMIT = 20161 # 28123

def d(n) # sum of n's proper divisors
  (factors(n) - [n] + [1]).inject(:+)
end

is_abund = []
(2..LIMIT).each{|n| is_abund[n] = true if d(n) > n}

abund_sum = []
(1..LIMIT).each{|n|
  is_abund[12..n].map.with_index{|t, i| i+12 if t}.compact.each{|a|
    (abund_sum << n; break) if is_abund[n-a]
  }
}

puts ([*1..LIMIT] - abund_sum).inject(:+)

# => 4179871
# real    0m19.857s
# user    0m19.538s
# sys     0m0.333s
