# The prime 41, can be written as the sum of
# six consecutive primes:
#
#   41 = 2 + 3 + 5 + 7 + 11 + 13
#
# This is the longest sum of consecutive primes
# that adds to a prime below one-hundred.
#
# The longest sum of consecutive primes below
# one-thousand that adds to a prime, contains
# 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written
# as the sum of the most consecutive primes?

require './euler.rb'; include Euler

LIMIT = 1_000_000
primes = sieve(LIMIT)

max_prime = 41; max_chain = 6

primes.each.with_index do |chain_start, i|
  break if chain_start > LIMIT / max_chain
  primes[i..-1].each.with_index.inject(0) do |sum, (next_prime, chain_len)|
    break if sum > LIMIT
    if chain_len > max_chain && $primes[sum]
      max_chain = chain_len
      max_prime = sum
    end
    sum + next_prime
  end
end

puts max_prime

# => 997651
# real    0m0.323s
# user    0m0.295s
# sys     0m0.026s