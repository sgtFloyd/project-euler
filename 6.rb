# The sum of the squares of the first ten natural numbers is,
#       1^2 + 2^2 + ... + 10^2 = 385
#
# The square of the sum of the first ten natural numbers is,
#       (1 + 2 + ... + 10)^2 = 55^2 = 3025
#
# Hence the difference between the sum of the squares of the first
# ten natural numbers and the square of the sum is 3025 - 385 = 2640.
#
# Find the difference between the sum of the squares of the first
# one hundred natural numbers and the square of the sum.

def sum_of_sq(range)
  range.inject(0){|sum, i| sum + i**2}
end

def sq_of_sum(range)
  range.inject(0){|sum, i| sum + i} ** 2
end

puts sq_of_sum(1..100) - sum_of_sq(1..100)

# => 25164150
# real    0m0.008s
# user    0m0.005s
# sys     0m0.003s