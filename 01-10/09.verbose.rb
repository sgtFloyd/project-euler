# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#     a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

(1..998).each do |a|
  (a..999).each do |b|
    c = 1000 - a - b
    if a**2 + b**2 == c**2
      puts a*b*c
      exit
    end
  end
end

# => 31875000
# real  0m0.079s
# user  0m0.070s
# sys   0m0.008s
