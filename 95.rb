# The proper divisors of a number are all the divisors
# excluding the number itself. For example, the proper
# divisors of 28 are 1, 2, 4, 7, and 14. As the sum of
# these divisors is equal to 28, we call it a perfect
# number.
# 
# Interestingly the sum of the proper divisors of 220
# is 284 and the sum of the proper divisors of 284 is
# 220, forming a chain of two numbers. For this reason,
# 220 and 284 are called an amicable pair.
# 
# Perhaps less well known are longer chains. For example,
# starting with 12496, we form a chain of five numbers:
# 
# 12496 -> 14288 -> 15472 -> 14536 -> 14264 -> ( 12496 -> ...)
# 
# Since this chain returns to its starting point, it is
# called an amicable chain.
# 
# Find the smallest member of the longest amicable chain
# with no element exceeding one million.

require './euler.rb'; include Euler

LIMIT = 1_000_000; SOFT_LIMIT = 15_000

$memo = {}
def memo_sum(n)
  return sum_divisors(n) if n > SOFT_LIMIT
  $memo[n] ||= sum_divisors(n)
end

def sum_divisors(n)
  ([1] + factors(n) - [n]).inject(:+)
end

def chain(n)
  next_n = memo_sum(n); chain = []
  while next_n && next_n <=LIMIT
    return [] if chain.include?(next_n)
    chain << next_n
    return chain if next_n == n
    next_n = memo_sum(next_n)
  end
  return []
end

max_n = -1; max_chain = 0
(1..SOFT_LIMIT).each do |n|
  n_chain = chain(n).size
  if n_chain > max_chain
    max_chain = n_chain
    max_n = n
  end
end

puts max_n

# => 14316
# real    0m13.306s
# user    0m13.276s
# sys     0m0.037s
