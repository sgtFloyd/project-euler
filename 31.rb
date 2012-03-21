# In England the currency is made up of pound, £, and pence, p,
# and there are eight coins in general circulation:
#   1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
# It is possible to make £2 in the following way:
#   1x£1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
#
# How many different ways can £2 be made using any number of coins?

coins = [1, 2, 5, 10, 20, 50, 100, 200]
target = 200

count = [1]
coins.each do |c|
  (c..target).each do |j|
    count[j] = (count[j] || 0) + count[j-c]
  end
end
puts count[target]


# => 73682
# real    0m0.007s
# user    0m0.005s
# sys     0m0.002s