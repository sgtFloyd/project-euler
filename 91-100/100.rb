# If a box contains twenty-one coloured discs, composed of fifteen blue discs
# and six red discs, and two discs were taken at random, it can be seen that the
# probability of taking two blue discs, P(BB) = (15/21)×(14/20) = 1/2.
#
# The next such arrangement, for which there is exactly 50% chance of taking two
# blue discs at random, is a box containing eighty-five blue discs and
# thirty-five red discs.
#
# By finding the first arrangement to contain over 10^12 = 1,000,000,000,000
# discs in total, determine the number of blue discs that the box would contain.

#   x = number of blue discs
#   y = total number of discs
#       (x/y) * (x-1/y-1) = 1/2
#    => 2x^2 - 2x - y^2 + y = 0
#    => x` = 3x + 2y - 2
#    => y` = 4x + 3y - 3

x = 15; y = 21
x_prime = 3*x + 2*y - 2
y_prime = 4*x + 3*y - 3
puts [x_prime, y_prime].inspect
