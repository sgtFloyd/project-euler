# We shall say that an n-digit number is pandigital if it makes
# use of all the digits 1 to n exactly once. For example, 2143
# is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?

require_relative '../euler.rb'; include Euler

max = -1
# all 8- and 9-digit pandigitals are divisible by 9
sieve(7_654_321).reverse.each do |prime|
  (puts prime; exit) if pandigital?(prime, 1..prime.to_s.length)
end

# => 7652413
# real    0m1.645s
# user    0m1.557s
# sys     0m0.085s
