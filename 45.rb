# Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:
#
#   Triangle      T(n) = n(n+1)/2     1, 3, 6, 10, 15, ...
#   Pentagonal    P(n) = n(3n-1)/2    1, 5, 12, 22, 35, ...
#   Hexagonal     H(n) = n(2n-1)      1, 6, 15, 28, 45, ...
# It can be verified that T(285) = P(165) = H(143) = 40755.
#
# Find the next triangle number that is also pentagonal and hexagonal.

def hexagonal(n)
  n*(2*n-1)
end

# x = n(3n-1)/2 => 0 = 3n^2 - n - 2x
def is_pentagonal(x)
  solution = solve_quad(3, -1, -2*x)
  solution.max % 1 == 0
end

# solve for n: 0 = an^2 + bn + c
def solve_quad(a, b, c)
  sqrt = Math.sqrt(b**2 - 4*a*c)
  return [(-b + sqrt)/(2*a),
          (-b - sqrt)/(2*a)]
end

# all hexagonal numbers are also triangular
n = 144; hn = hexagonal(n)
(n += 1; hn = hexagonal(n)) while !is_pentagonal(hn)

puts hn

# => 1533776805
# real    0m0.056s
# user    0m0.053s
# sys     0m0.003s
