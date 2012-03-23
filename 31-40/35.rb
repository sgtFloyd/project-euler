# The number, 197, is called a circular prime because all rotations
# of the digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100:
#   2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?

require_relative '../euler.rb'; include Euler

def circular?(arr)
  arr.map.with_index do |_, i|
    rotation = (arr*2)[i, arr.size].join.to_i
    return false unless $primes[rotation]
  end
  true
end

puts sieve(1_000_000).select{|prime| circular?(prime.to_s.split(''))}.count

# => 55
# real    0m2.118s
# user    0m2.099s
# sys     0m0.019s
