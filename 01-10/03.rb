# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

require_relative '../euler.rb'; include Euler

num = 600851475143
sieve( Math.sqrt(num).to_i ).reverse.each do |prime|
  (puts prime; break) if num%prime==0
end

# => 6857
# real    0m0.417s
# user    0m0.405s
# sys     0m0.010s