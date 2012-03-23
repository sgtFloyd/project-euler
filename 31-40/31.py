# In England the currency is made up of pound, L, and pence, p,
# and there are eight coins in general circulation:
#   1p, 2p, 5p, 10p, 20p, 50p, L1 (100p) and L2 (200p).
#
# It is possible to make L2 in the following way:
#   1xL1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
#
# How many different ways can L2 be made using any number of coins?

COINS = [1, 2, 5, 10, 20, 50, 100, 200]
TARGET = 200

count = [0]*(TARGET+1); count[0] = 1
for c in COINS:
  for j in xrange(c, TARGET+1):
    count[j] += count[j-c]

print count[TARGET]

# => 73682
# real    0m0.015s
# user    0m0.008s
# sys     0m0.006s
