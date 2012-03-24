# It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
#
# 9 =  7 + 2*1^2
# 15 = 7 + 2*2^2
# 21 = 3 + 2*3^2
# 25 = 7 + 2*3^2
# 27 = 19 + 2*2^2
# 33 = 31 + 2*1^2
#
# It turns out that the conjecture was false.
#
# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

require './euler.rb'; include Euler

def composite?(n)
  sieve(n) if $primes.length >= n
  !$primes[n]
end

comp = 33
while true
  comp += 2; conjecture = false
  next unless composite?(comp)
  sieve(comp).each do |prime|
    next if conjecture
    conjecture = true if square?((comp - prime)/2)
  end
  (puts comp; exit) unless conjecture
end

# => 5777
