# The cube, 41063625 (345^3), can be permuted to produce two other cubes:
# 56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube
# which has exactly three permutations of its digits which are also cube.
#
# Find the smallest cube for which exactly five permutations of its digits are
# cube.

$cubes = Hash.new{[]}
(1..Float::INFINITY).each do |i|
  key = (i**3).to_s.chars.sort.join
  if ($cubes[key] += [i]).count==5
    puts $cubes[key].min**3; exit
  end
end

# => 127035954683
# real    0m0.118s
# user    0m0.088s
# sys     0m0.028s
