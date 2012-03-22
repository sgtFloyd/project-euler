# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

$factorial = [1]
def fact(n)
  $factorial[n] ||= n*fact(n-1)
end

puts (10..50_000).inject(0){|total_sum, i|
  total_sum + (i.to_s.split('').inject(0){|sum, n| sum + fact(n.to_i)} == i ? i : 0)
}

# => 40730
# real    0m0.267s
# user    0m0.263s
# sys     0m0.004s
