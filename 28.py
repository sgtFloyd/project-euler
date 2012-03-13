# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#
#   21 22 23 24 25
#   20  7  8  9 10
#   19  6  1  2 11
#   18  5  4  3 12
#   17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

SIZE = 1001
print sum(
  map(lambda i: i**2, range(3, SIZE+1, 2))         +  # upper-right diagonal
  map(lambda i: i**2 + 1, range(2, SIZE+1, 2))     +  # bottom-left diagonal
  map(lambda i: i**2 + (i+1), range(2, SIZE+1, 2)) +  # upper-left diagonal
  map(lambda i: i**2 - (i-1), range(2, SIZE+1, 2)) +  # bottom-right diagonal
  [1]                                                 # center 1
)

# => 669171001
#
# real    0m0.014s
# user    0m0.008s
# sys     0m0.006s