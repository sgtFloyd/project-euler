# The number 3797 has an interesting property. Being prime
# itself, it is possible to continuously remove digits from
# left to right, and remain prime at each stage: 3797, 797,
# 97, and 7. Similarly we can work from right to left: 3797,
# 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both
# truncatable from left to right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable
# primes.

require './euler.rb'; include Euler

def truncatable?(n)
  return false if n < 10
  digits = n.to_s.split('')
  (0...digits.size).each do |i|
    return false unless $primes[digits[i..-1].join.to_i]
    return false unless $primes[digits[0..-i].join.to_i]
  end
  true
end

puts sieve(1_000_000).select{|prime| truncatable?(prime)}.inject(:+)

# => 748317
# real    0m1.842s
# user    0m1.824s
# sys     0m0.020s