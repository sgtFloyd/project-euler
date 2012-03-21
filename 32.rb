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

def pandigital?(a, b, c)
  (a.to_s + b.to_s + c.to_s).split('').sort.join == '123456789'
end

def prime_factor(num)
  pf = []
  (2..Math.sqrt(num).to_i).each do |p|
    break if num == 1
    while num%p == 0
      num /= p
      pf << p
    end
  end
  pf << num unless num == 1
  pf
end

def factor(num)
  pf = prime_factor(num)
  (1..pf.length).inject([]) do |factors, s|
    factors + pf.combination(s).map{|c| c.inject(:*)}
  end.uniq
end

puts [1,2,3,4,5,6,7,8,9]
      .permutation(4)
      .map{|perm|
        perm.join.to_i
      }.inject([]){|pandigs, prod|
        factor(prod).each {|fact|
          pandigs << prod if pandigital?(prod, fact, prod/fact)
        }; pandigs
      }.uniq.inject(:+)

# => 45228
# real    0m0.343s
# user    0m0.339s
# sys     0m0.004s
