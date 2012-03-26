# The arithmetic sequence, 1487, 4817, 8147, in which
# each of the terms increases by 3330, is unusual in
# two ways: (i) each of the three terms are prime, and,
# (ii) each of the 4-digit numbers are permutations of
# one another.
#
# There are no arithmetic sequences made up of three
# 1-, 2-, or 3-digit primes, exhibiting this property,
# but there is one other 4-digit increasing sequence.
#
# What 12-digit number do you form by concatenating
# the three terms in this sequence?

require_relative '../euler.rb'; include Euler

def permutation?(a, b)
  a.to_s.split('').sort == b.to_s.split('').sort
end

primes = sieve(10_000).select{|p| p > 1000} # 1,061 4-digit primes

primes.each.with_index do |p, i|
  primes[i..-1].inject([]) do |perms, q|
    permutation?(p, q) ? perms << q : perms
  end.combination(2).inject({}) do |diffs, (p, q)|
    diffs[q-p] ||= []; diffs[q-p] << [p, q]
    diffs.each do |diff, combos|
      if combos.inject(:|).size == 3 && !combos.flatten.include?(1487)
        puts combos.flatten.uniq.join; exit
      end
    end
    diffs
  end
end

# => 296962999629
# real    0m2.130s
# user    0m2.127s
# sys     0m0.004s