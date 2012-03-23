# The number, 197, is called a circular prime because all rotations
# of the digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100:
#   2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?

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

def circular?(arr)
  arr.map.with_index do |_, i|
    rotation = (arr*2)[i, arr.size].join.to_i
    return false unless $primes[rotation]
  end
  true
end

circular = []
sieve(1_000_000).each do |prime|
  circular << prime if circular?(prime.to_s.split(''))
end

puts circular.count

# => 55
# real    0m2.118s
# user    0m2.099s
# sys     0m0.019s
