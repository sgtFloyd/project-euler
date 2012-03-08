# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#     a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def is_triplet(a,b,c)
  return a**2 + b**2 == c**2
end

def sums_up(a,b,c)
  return a+b+c == 1000
end

(1...999).each do |a|
  (a...999).each do |b|
    (b...999).each do |c|
      (puts a*b*c; exit) if sums_up(a, b, c) && is_triplet(a, b, c)
    end
  end
end

# => 31875000
# real    0m9.408s
# user    0m9.305s
# sys     0m0.045s