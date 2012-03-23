# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
# therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

MAX = 10_000

def d(n) # sum of n's proper divisors
  divisors(n).inject(:+)
end

def divisors(n) # n's proper divisors
  pf = prime_factor(n)
  (1...pf.size).inject([]) do |f, size|
    f + pf.combination(size).map{|combo| combo.inject(:*)}
  end.uniq + [1]
end

def prime_factor(n)
  factors = []
  (2..Math.sqrt(n)).each do |p|
    break if n == 1
    while n%p == 0
      n /= p
      factors << p
    end
  end
  factors << n unless n == 1
  factors
end

pairs = [false] * MAX
(2...MAX).each do |a|
  next if pairs[a]
  next if (b = d(a)) >= MAX
  next if b == a
  pairs[a] = pairs[b] = true if (a == d(b))
end

puts pairs.map.with_index{|t, i| i if t}.compact.inject(:+)

# => 31626
# real    0m0.560s
# user    0m0.556s
# sys     0m0.003s
