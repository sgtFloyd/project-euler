# If the numbers 1 to 5 are written out in words: one, two,
# three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19
# letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive
# were written out in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342
# (three hundred and forty-two) contains 23 letters and 115
# (one hundred and fifteen) contains 20 letters. The use of
# "and" when writing out numbers is in compliance with British
# usage.

ONES = {0 => 0,
        1 => 3, # one
        2 => 3, # two
        3 => 5, # three
        4 => 4, # four
        5 => 4, # five
        6 => 3, # six
        7 => 5, # seven
        8 => 5, # eight
        9 => 4} # nine

TENS = {0 => 0,
        1 => 3, # ten
        2 => 6, # twenty
        3 => 6, # thirty
        4 => 5, # forty
        5 => 5, # fifty
        6 => 5, # sixty
        7 => 7, # seventy
        8 => 6, # eighty
        9 => 6} # ninety

TEENS = {11 => 6, # eleven
         12 => 6, # twelve
         13 => 8, # thirteen
         14 => 8, # fourteen
         15 => 7, # fifteen
         16 => 7, # sixteen
         17 => 9, # seventeen
         18 => 8, # eighteen
         19 => 8} # nineteen

THOUSAND = 11 # one thousand
HUNDRED = 7   # hundred
AND = 3       # and

# count characters in an integer, up to 1,000
def count_chars(n)
  return THOUSAND if n == 1_000
  total = 0
  if n >= 100
    total += ONES[n/100] + HUNDRED
    total += AND unless n%100 == 0
    n %= 100
  end
  (total += TEENS[n]; return total) if n > 10 && n < 20
  (total += TENS[n/10]; n %= 10) if n >= 10
  total += ONES[n] if n > 0
  total
end

puts (1..1_000).inject(0){|sum, i| sum + count_chars(i)}

# => 21124
# real    0m0.007s
# user    0m0.005s
# sys     0m0.002s