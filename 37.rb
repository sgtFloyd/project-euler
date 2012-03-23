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

$primes = [false, false, true] # initial values
# memoized, optimized sieve of eratosthenes
def sieve(n)
  lower = $primes.length
  $primes += [true, false] * ((n-lower)/2+1) if n+1 > lower
  (3..Math.sqrt(n)).each do |i|
    (3*i..n).step(2*i).each do |j|
      $primes[j] = false
    end if $primes[i]
  end
  $primes.map.with_index{|t, i| i if t}.compact
end

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
