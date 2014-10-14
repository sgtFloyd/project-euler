# In the 5 by 5 matrix below, the minimal path sum from the
# top left to the bottom right, by only moving to the right
# and down, is indicated by asterix and is equal to 2427.
#
#       *131*   673    234    103    18
#       *201*  *96 *  *342*   965    150
#        630    803   *746*  *422*   111
#        537    699    497   *121*   956
#        805    732    524   *37 *  *331*
#
# Find the minimal path sum, in data/81.txt, a 31K text file
# containing a 80 by 80 matrix, from the top left to the bottom
# right by only moving right and down.

require './euler.rb'; include Euler

$grid = []

input = data_file('81.txt')
while (line = input.gets)
  $grid << eval("[#{line}]")
end

$memo = { '79/79' => 7981 }
def shortest_path(x, y)
  return if [x,y].include?($grid.size) # stay within grid bounds
  $memo["#{x}/#{y}"] ||=
    $grid[x][y] + [shortest_path(x+1, y), # bottom neighbor
                   shortest_path(x, y+1)  # right neighbor
                  ].compact.min 
end

puts shortest_path(0,0)

# => 427337
# real    0m0.027s
# user    0m0.024s
# sys     0m0.003s