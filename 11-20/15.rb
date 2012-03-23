# Starting in the top left corner of a 2x2 grid, there are 6
# routes (without backtracking) to the bottom right corner.
# 
# How many routes are there through a 20x20 grid?

require_relative '../euler.rb'; include Euler

# (2n choose n) => 2n! / (n! * n!)
def count_paths(grid_size)
  factorial(2*grid_size) / (factorial(grid_size) * factorial(grid_size))
end

puts count_paths(20)

# => 137846528820
# real    0m0.009s
# user    0m0.004s
# sys     0m0.002s