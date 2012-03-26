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

require './euler.rb'; include Euler

def permutation?(a, b)
  a.to_s.split('').sort == b.to_s.split('').sort
end

primes = sieve(10_000).select{|p| p > 1000} # 1,061 4-digit primes

$perms = {}
primes.each.with_index do |p, i|
  primes[i+1..-1].each do |q|
    if permutation?(p, q)
      $perms[p] ||= []
      $perms[p] << q
    end
  end
end

$perms.select{|k,v| v.count > 1} # 464 primes with 2+ permutations
  .each do |prime, perms|

  diffs = {}
  perms.unshift(prime).combination(2).each do |p, q|
    diffs[q-p] ||= []
    diffs[q-p] << [p, q]
  end

  winner = diffs.select{|diff, combos| combos.size == 2 && combos.inject(:|).size == 3 }
  (puts winner.values.flatten.uniq.join; exit) unless (winner.empty? || winner.values.flatten.include?(1487))

end

# => 296962999629
