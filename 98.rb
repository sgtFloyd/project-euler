# By replacing each of the letters in the word CARE with 1, 2, 9, and 6
# respectively, we form a square number: 1296 = 362. What is remarkable
# is that, by using the same digital substitutions, the anagram, RACE,
# also forms a square number: 9216 = 962. We shall call CARE (and RACE)
# a square anagram word pair and specify further that leading zeroes are
# not permitted, neither may a different letter have the same digital
# value as another letter.
#
# Using data/98.txt, a 16K text file containing nearly two-thousand
# common English words, find all the square anagram word pairs (a
# palindromic word is NOT considered to be an anagram of itself).
#
# What is the largest square number formed by any member of such a pair?
#
# NOTE: All anagrams formed must be contained in the given text file.

require './euler.rb'; include Euler

$words = {}; INDEX = 3 # words indexed by first three characters
data_file('98.txt').read.gsub('"', '').split(',').each do |word|
  ($words[word[0,INDEX]] ||= []) << word
end

# find all anagram pairs
pairs = $words.values.flatten.inject([['NO', 'ON']]) do |pairs, word|
  next(pairs) if word.length < INDEX
  word.split('').permutation(INDEX).map{|c| c.join}.uniq.each do |pair|
    next unless $words.include?(pair)
    $words[pair].each do |candidate|
      next if word == candidate
      pairs << [word, candidate].sort if anagram?(word, candidate)
    end
  end; pairs
end.uniq

pairs
