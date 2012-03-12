# n! means n x (n - 1) x ... x 3 x 2 x 1
# 
# For example, 10! = 10 x 9 x ... x 3 x 2 x 1 = 3628800,
# and the sum of the digits in the number 10! is
#   3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!

def factorial(n)
  [*1..n].inject(:*)
end

puts factorial(100).to_s.split('').inject(0){|sum, n| sum + n.to_i}

# => 648
# real    0m0.008s
# user    0m0.005s
# sys     0m0.002s
