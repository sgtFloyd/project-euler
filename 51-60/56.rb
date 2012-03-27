# A googol (10^100) is a massive number: one followed by one-hundred zeros;
# 100^100 is almost unimaginably large: one followed by two-hundred zeros.
# Despite their size, the sum of the digits in each number is only 1.
#
# Considering natural numbers of the form, a^b, where a, b < 100, what is the
# maximum digital sum?

def sum_digits(n)
  n.to_s.split('').map(&:to_i).inject(:+)
end

max = 0
(1..100).each do |a|
  (1..100).each do |b|
    sum = sum_digits(a**b)
    max = sum if sum > max
  end
end

puts max

# => 972
# real    0m0.508s
# user    0m0.502s
# sys     0m0.003s
