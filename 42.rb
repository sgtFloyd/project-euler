# The nth term of the sequence of triangle numbers is given by,
# t(n) = (1/2)n(n+1); so the first ten triangle numbers are:
#
#   1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# By converting each letter in a word to a number corresponding
# to its alphabetical position and adding these values we form
# a word value. For example, the word value for SKY is 19 + 11
# + 25 = 55 = t(10). If the word value is a triangle number then
# we shall call the word a triangle word.
#
# Using data/42.txt, a 16K text file containing nearly two-
# thousand common English words, how many are triangle words?

require './euler.rb'; include Euler

def score(word)
  word.split('').inject(0){|sum, char| sum + char.ord - 64}
end

puts data_file('42.txt').read.gsub('"', '').split(',').select{ |word|
  triangle?(score(word))
}.count

# => 162
# real    0m0.025s
# user    0m0.022s
# sys     0m0.002s
