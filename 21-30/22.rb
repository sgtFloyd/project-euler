# Using data/22.txt, a 46K text file containing over five-thousand
# first names, begin by sorting it into alphabetical order. Then working
# out the alphabetical value for each name, multiply this value by its
# alphabetical position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN,
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the
# list. So, COLIN would obtain a score of 938 x 53 = 49714.
#
# What is the total of all the name scores in the file?

$names = File.open('data/22.txt').read.gsub('"', '').split(',').sort

def score(name, index)
  name.split('').inject(0){|sum, char| sum + char.ord - 64} * index
end

sum = 0
$names.each_with_index do |name, i|
  sum += score(name, i+1)
end

puts sum

# => 871198282
# real    0m0.045s
# user    0m0.042s
# sys     0m0.003s