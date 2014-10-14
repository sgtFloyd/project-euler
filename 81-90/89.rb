# For a number written in Roman numerals to be considered valid there are basic
# rules which must be followed. Even though the rules allow some numbers to be
# expressed in more than one way there is always a "best" way of writing a
# particular number.
#
# For example, it would appear that there are at least six ways of writing the
# number sixteen:
#
# IIIIIIIIIIIIIIII
# VIIIIIIIIIII
# VVIIIIII
# XIIIIII
# VVVI
# XVI
#
# However, according to the rules only XIIIIII and XVI are valid, and the last
# example is considered to be the most efficient, as it uses the least number of
# numerals.
#
# The 11K text file, data/89.txt, contains one thousand numbers written in
# valid, but not necessarily minimal, Roman numerals; see About... Roman
# Numerals for the definitive rules for this problem.
#
# Find the number of characters saved by writing each of these in their minimal
# form.
#
# Note: You can assume that all the Roman numerals in the file contain no more
# than four consecutive identical units.

require './euler.rb'; include Euler

ROMAN_NUMERALS = {
  'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400, 'C' => 100, 'XC' => 90,
  'L' => 50, 'XL' => 40, 'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1
}

def decode(str)
  return 0 if str.blank?
  ROMAN_NUMERALS.each do |key, val|
    return val+decode(str.sub(key, '')) if str.start_with?(key)
  end
end

def encode(int)
  return '' if int <= 0
  ROMAN_NUMERALS.each do |key, val|
    return key+encode(int-val) if int >= val
  end
end

puts data_file('89.txt').read.split("\n").map{|original|
  original.length - encode(decode(original)).length
}.inject(:+)

# => 743
# real    0m0.122s
# user    0m0.093s
# sys     0m0.028s
