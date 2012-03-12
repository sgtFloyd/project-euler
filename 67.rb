# By starting at the top of the triangle below and moving to adjacent
# numbers on the row below, the maximum total from top to bottom is 23.
#
#          3
#         7 4
#        2 4 6
#       8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom in data/67.txt, a 15K text
# file containing a triangle with one-hundred rows.
#
# NOTE: This is a much more difficult version of Problem 18. It is not
# possible to try every route to solve this problem, as there are 2^99
# altogether! If you could check one trillion (10^12) routes every second
# it would take over twenty billion years to check them all. There is an
# efficient algorithm to solve it. ;o)

DATA = File.open('data/67.txt').read
        .gsub("\n", ' ')
        .split(' ')
        .map(&:to_i)

HEIGHT = 99

def triangle(term)
  term * (term+1) / 2
end

def cell(x, y) # get cell at row x, position y (0-indexed)
  DATA[triangle(x)+y]
end

def max_neighbor(x, y)
  [cell(x+1, y), cell(x+1, y+1)].max
end

# fold triangle up, keeping track of max path to base for each cell
(HEIGHT-1).step(0,-1).each do |row|
  (0..row).each do |col|
    DATA[triangle(row)+col] += max_neighbor(row, col)
  end
end

puts DATA[0]

# => 7273
# real    0m0.013s
# user    0m0.010s
# sys     0m0.002s
