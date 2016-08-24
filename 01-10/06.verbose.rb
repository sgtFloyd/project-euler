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

sum = 0
sum_of_squares = 0
(1..100).each do |i|
  sum += i
  sum_of_squares += i**2
end
square_of_sum = sum**2

puts square_of_sum - sum_of_squares

# => 25164150
# real  0m0.039s
# user  0m0.030s
# sys   0m0.007s
