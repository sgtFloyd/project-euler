# We shall say that an n-digit number is pandigital if it makes use of
# all the digits 1 to n exactly once; for example, the 5-digit number,
# 15234, is 1 through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product
# identity can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to
# only include it once in your sum.

require './euler.rb'; include Euler

puts [1,2,3,4,5,6,7,8,9]
      .permutation(4)
      .map{|perm|
        perm.join.to_i
      }.inject([]){|pandigs, prod|
        factor(prod).each {|fact|
          pandigs << prod if pandigital?([prod, fact, prod/fact], 1..9)
        }; pandigs
      }.uniq.inject(:+)

# => 45228
# real    0m0.343s
# user    0m0.339s
# sys     0m0.004s
