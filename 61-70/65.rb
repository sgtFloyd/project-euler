# The square root of 2 can be written as an infinite continued fraction.
#
# √2 = 1 + 1/(2 + 1/(2 + 1/(2 + 1/2 + ...
#
# The infinite continued fraction can be written, √2 = [1;(2)], (2) indicates
# that 2 repeats ad infinitum. In a similar way, √23 = [4;(1,3,1,8)].
#
# It turns out that the sequence of partial values of continued fractions for
# square roots provide the best rational approximations. Let us consider the
# convergents for √2.
#
#    1 + 1/2 = 3/2
#    1 + 1/(2 + 1/2) = 7/5
#    1 + 1/(2 + 1/(2 + 1/2)) = 17/12
#    1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29
#
# Hence the sequence of the first ten convergents for √2 are:
# 1, 3/2, 7/5, 17/12, 41/29, 99/70, 239/169, 577/408, 1393/985, 3363/2378, ...
#
# What is most surprising is that the important mathematical constant,
# e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].
#
# The first ten terms in the sequence of convergents for e are:
# 2, 3, 8/3, 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...
# The sum of digits in the numerator of the 10th convergent is 1+4+5+7=17.
#
# Find the sum of digits in the numerator of the 100th convergent of the
# continued fraction for e.

require_relative '../core_ext/math'

# Calculate a value of the sequence:
#   [1,2,1, 1,4,1, 1,6,1, 1,8,1, ...]
def tail(idx)
  (idx - 1) % 3 > 0 ? 1
    : (idx + 2) / 3 * 2
end

# Calculate the nth expansion of e's continued fraction
# ex: expansion(5) => "2+ 1/(1+ 1/(2+ 1/(1+ 1/(1+ 1/4))))"
def nth_expansion(n)
  n==0 ? "2" : "2+ 1/#{nest(n-1)}"
end
def nest(total, depth=0)
  return tail(depth) if depth == total
  "(#{tail(depth)}+ 1/#{nest(total, depth+1)})"
end

# evaluate an expression of the form (i + n/d) or
# (i + 1/n/d) into a single proper fraction
#   ex: 1 + 1/4   => 5/4
#       2 + 1/6/3 => 15/6
def evaluate(str)
  int, frac = str.gsub(/[\(\)]/, '').split(/\s*\+\s*/)
  n, d = frac.count('/') == 1 ? frac.split('/')
                              : frac.split('/')[1,2].reverse
  "#{n.to_i + int.to_i*d.to_i}/#{d}"
end

def inner_expression(str)
  str[str.rindex('(')..str.index(')')] rescue nil
end

def nth_expansion_reduced(n)
  continued_fraction = nth_expansion(n)
  while expression = inner_expression(continued_fraction)
    continued_fraction.gsub!(expression, evaluate(expression))
  end
  Math.reduce_fraction evaluate(continued_fraction)
end

puts nth_expansion_reduced(99).split('/')[0]
      .chars.map(&:to_i).inject(:+)

# => 272
# real    0m0.084s
# user    0m0.054s
# sys     0m0.028s
