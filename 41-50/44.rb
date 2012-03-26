# Pentagonal numbers are generated by the formula, Pn=n(3n1)/2.
# The first ten pentagonal numbers are:
#
#   1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
#
# It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However,
# their difference, 70 - 22 = 48, is not pentagonal.
#
# Find the pair of pentagonal numbers, Pj and Pk, for which their
# sum and difference is pentagonal and D = |Pk - Pj| is minimised;
# what is the value of D?

require_relative '../euler.rb'; include Euler

EST = 2_500

(1..EST).each do |j|
  pj = pentagonal(j)
  (j..EST).each do |k|
    pk = pentagonal(k)
    next unless pentagonal?(pk+pj)
    next unless pentagonal?(pk-pj)
    puts pk-pj; exit
  end
end

# => 5482660
# real    0m3.873s
# user    0m3.871s
# sys     0m0.005s