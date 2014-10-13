# All square roots are periodic when written as continued fractions and can be
# written in the form:
#   √N = a0 + 1/(a0 + 1/(a2 + 1/(a3 + ...)))
#
# For example, let us consider √23:
#   √23 = 4 + √23 — 4
#       = 4 + 1/1/(√23 — 4)
#       = 4 + 1/(1 + (√23 — 4)/7)
#
# If we continue we would get the following expansion:
#   √23 = 4 + 1/(1 + 1/(3 + 1/(1 + 1/(8 + ...))))
#
# The process can be summarised as follows:
#   a0 = 4, 1/(√23-4) = 1(√23+4)/7  = 1 + (√23-3)/7
#   a1 = 1, 7/(√23-3) = 7(√23+3)/14 = 3 + (√23-3)/2
#   a2 = 3, 2/(√23-3) = 2(√23+3)/14 = 1 + (√23-4)/7
#   a3 = 1, 7/(√23-4) = 7(√23+4)/7  = 8 + (√23-4)/1
#   a4 = 8, 1/(√23-4) = 1(√23+4)/7  = 1 + (√23-3)/7
#   a5 = 1, 7/(√23-3) = 7(√23+3)/14 = 3 + (√23-3)/2
#   a6 = 3, 2/(√23-3) = 2(√23+3)/14 = 1 + (√23-4)/7
#   a7 = 1, 7/(√23-4) = 7(√23+4)/7  = 8 + (√23-4)/1
#
# It can be seen that the sequence is repeating. For conciseness, we use the
# notation √23 = [4;(1,3,1,8)], to indicate that the block (1,3,1,8) repeats
# indefinitely.
#
# The first ten continued fraction representations of (irrational) square roots
# are:
#   √2 =  [1;(2)]         period=1
#   √3 =  [1;(1,2)]       period=2
#   √5 =  [2;(4)]         period=1
#   √6 =  [2;(2,4)]       period=2
#   √7 =  [2;(1,1,1,4)]   period=4
#   √8 =  [2;(1,4)]       period=2
#   √10 = [3;(6)]         period=1
#   √11 = [3;(3,6)]       period=2
#   √12 = [3;(2,6)]       period=2
#   √13 = [3;(1,1,1,1,6)] period=5
#
# Exactly four continued fractions, for N ≤ 13, have an odd period.
#
# How many continued fractions for N ≤ 10000 have an odd period?

require_relative '../core_ext/memoize'

def a0(root)
  Math.sqrt(root).floor
end

# wikipedia.org/wiki/Methods_of_computing_square_roots#Continued_fraction_expansion
memo def nth_expansion(root, depth)
  return [0, 1, a0(root)] if depth == 0
  m, d, a = nth_expansion(root, depth-1)
  m = d * a - m; d = (root - m**2) / d
  a = (a0(root) + m) / d; [m, d, a]
end

puts (1..10_000).count{|root|
  next if (a0 = a0(root)) == Math.sqrt(root)
  period = []; (1..Float::INFINITY).each{|i|
    period << nth_expansion(root, i)[-1]
    break if period[-1] == a0*2
  }; period.length.odd?
}

# => 1322
# real    0m1.443s
# user    0m1.389s
# sys     0m0.050s
