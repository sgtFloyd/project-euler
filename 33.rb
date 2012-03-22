# The fraction 49/98 is a curious fraction, as an inexperienced mathematician
# in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which
# is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction, less
# than one in value, and containing two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms,
# find the value of the denominator.

def curious?(n, d)
  ns = n.to_s.split('')
  ds = d.to_s.split('')
  unless (common = ns & ds).empty?
    na = (ns - common).first
    da = (ds - common).first
    return na.to_f/da.to_f == n/d.to_f
  end
  false
end

curious = []
(10..98).each do |n|
  (n+1..99).each do |d|
    next if n%10==0 && d%10==0 # trivial examples
    curious << [n, d] if curious?(n, d)
  end
end

puts curious.inject(1){|prod, (n, d)| prod * (n.to_f/d)}

# => 0.010000000000000002
# real    0m0.036s
# user    0m0.033s
# sys     0m0.002s
