# It can be seen that the number, 125874, and its double, 251748,
# contain exactly the same digits, but in a different order.
#
# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x,
# and 6x, contain the same digits.

def answer?(x)
  return false unless (1*x).to_s.split('').sort == (6*x).to_s.split('').sort
  return false unless (2*x).to_s.split('').sort == (5*x).to_s.split('').sort
  return false unless (4*x).to_s.split('').sort == (3*x).to_s.split('').sort
  return true
end

x = 1
x += 1 while !answer?(x)
puts x

# => 142857
# real    0m1.531s
# user    0m1.528s
# sys     0m0.003s
