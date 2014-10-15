# By counting carefully it can be seen that a rectangular grid measuring 3 by 2
# contains eighteen rectangles:   _ _ _
#                      _         |_|_|_|
#   6 1x1 rectangles: |_|_       |_|_|_|         _ _
#   4 2x1 rectangles: |_|_|_                    |_|_|
#   2 3x1 rectangles: |_|_|_| 2 2x2 rectangles: |_|_|_
#   3 1x2 rectangles: |_|     1 3x2 rectangle:  |_|_|_|
#                     |_|                       |_|_|_|
#
# Although there exists no rectangular grid that contains exactly two million
# rectangles, find the area of the grid with the nearest solution.

TARGET = 2_000_000

# This can be optimized to
# Math.nth_triangle(width) *
#   Math.nth_triangle(height)
def rectangles(width, height)
  (1..width).map do |w|
    (1..height).map do |h|
      w*h
    end.inject(:+)
  end.inject(:+)
end

$closest_distance = Float::INFINITY
$closest_dimensions = []
(1..2_000).each do |w|
  (1..2_000).each do |h|
    count = rectangles(w, h)
    if (TARGET-count).abs < $closest_distance
      $closest_distance = (TARGET-count).abs
      $closest_dimensions = [w, h]
    end
    break if count > TARGET
  end
end
puts $closest_dimensions.inject(:*)

# => 2772
# real    0m8.908s
# user    0m8.850s
# sys     0m0.046s
