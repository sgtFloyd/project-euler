# A permutation is an ordered arrangement of objects. For example,
# 3124 is one possible permutation of the digits 1, 2, 3 and 4. If
# all of the permutations are listed numerically or alphabetically,
# we call it lexicographic order. The lexicographic permutations of
# 0, 1 and 2 are:
#
#   012   021   102   120   201   210
#
# What is the millionth lexicographic permutation of the digits
#   0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

puts [*0..9].permutation.to_a[999_999].join

# => 2783915460
# real    0m1.897s
# user    0m1.674s
# sys     0m0.223s