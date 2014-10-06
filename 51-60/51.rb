# By replacing the 1st digit of the 2-digit number *3, it turns out that six of
# the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
#
# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit
# number is the first example having seven primes among the ten generated
# numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and
# 56993. Consequently 56003, being the first member of this family, is the
# smallest prime with this property.
#
# Find the smallest prime which, by replacing part of the number (not
# necessarily adjacent digits) with the same digit, is part of an eight prime
# value family.

require_relative '../euler.rb'; include Euler
alias :is_prime? :miller_rabin

TARGET_FAMILY_SIZE = 8

def primes_in_family(root)
  return [] unless is_prime?(root)
  largest_family = []
  digits = root.to_s.chars
  length = digits.length - 1

  [*1..length-1].each do |_|
    [*0..length].combination(_).each do |replacements|
      # Don't lead with a zero or end with an even number
      replacement_chars = length.in?(replacements) ? [1,3,5,7,9] :
                               0.in?(replacements) ? [*1..9] : [*0..9]
      primes = replacement_chars.each_with_object([]) do |char, primes|
        replaced = digits.dup.tap{|d|replacements.each{|i|d[i]=char}}.join.to_i
        primes << replaced if is_prime?(replaced)
      end
      largest_family = primes if primes.length > largest_family.length
    end
  end
  largest_family
end

test = 56003
while true
  primes = primes_in_family(test)
  if primes.count >= TARGET_FAMILY_SIZE
    puts primes.sort.first; exit
  end
  test += 2
end

# => 121313
# real    0m8.159s
# user    0m8.124s
# sys	    0m0.034s
