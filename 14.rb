# The following iterative sequence is defined for the set of positive integers:
#
#     n -> n/2 (n is even)
#     n -> 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
#     13  40  20  10  5  16  8  4  2  1
#
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10
# terms. Although it has not been proved yet (Collatz Problem), it is thought that
# all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

def chain(seed)
  return 1 if seed == 1                     # base case
  1 + chain(seed%2==0 ? seed/2 : 3*seed+1)  # recursive case
end

max_seed = -1; max_chain = -1
(1..1_000_000).step(2).each do |i|
  len = chain(i)
  (max_seed = i; max_chain = len) if len > max_chain
end

puts max_seed

# => 837799
# real    0m7.494s
# user    0m7.493s
# sys     0m0.006s