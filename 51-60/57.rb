# It is possible to show that the square root of two can be expressed
# as an infinite continued fraction.
#
#   sqrt(2) = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
#
# By expanding this for the first four iterations, we get:
#
#   1 + 1/2 = 3/2 = 1.5
#   1 + 1/(2 + 1/2) = 7/5 = 1.4
#   1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
#   1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...
#
# The next three expansions are 99/70, 239/169, and 577/408, but the
# eighth expansion, 1393/985, is the first example where the number of
# digits in the numerator exceeds the number of digits in the denominator.
#
# In the first one-thousand expansions, how many fractions contain a
# numerator with more digits than denominator?

require_relative '../euler.rb'; include Euler

# the nth expansion for continued fraction of sqrt(2)
def expansion(n)
  "1 + 1/#{nesting(n)}"
end

# resursive nested portion for continued fraction
$nest = [nil, '2'] # memoized with initial value
def nesting(n)
  $nest[n] ||= "(2 + 1/#{nesting(n-1)})"
end

# deepest nested expression surrounded in str
def inner(str)
  str[str.rindex('(')..str.index(')')] rescue nil
end

# combine an expression of the form (i + n/d) or (i + 1/n/d)
# into a single proper fraction
def combine(str)
  int, frac = str.gsub(/[\(\)]/, '').split(' + ')
  n, d = frac.count('/') == 1 ?
          frac.split('/') :
          frac.split('/')[1,2].reverse
  "#{n.to_i + int.to_i*d.to_i}/#{d}"
end

# reduce a fraction to its lowest terms
def reduce(frac)
  n, d = frac.split('/').map(&:to_i)
  unless (g = gcd(n, d)) == 1
    n /= g; d /= g
  end
  "#{n}/#{d}"
end

# calculate the nth expansion as a reduced fraction
def reduced_expansion(n)
  exp = expansion(n)
  while inn = inner(exp)
    exp.gsub!(inn, combine(inn))
  end
  reduce(combine(exp))
end

# determine if a fraction meets our criteria
def criteria?(frac)
  n, d = frac.split('/')
  n.length > d.length
end

puts [*1..1000].select{|n|
  criteria?(reduced_expansion(n))
}.count

# => 153
# real    0m29.294s
# user    0m29.235s
# sys     0m0.079s
