# It is possible to write five as a sum in exactly six different ways:
#
#    4 + 1
#    3 + 2
#    3 + 1 + 1
#    2 + 2 + 1
#    2 + 1 + 1 + 1
#    1 + 1 + 1 + 1 + 1
#
# How many different ways can one hundred be written as a sum of at least two
# positive integers?

TARGET = 100
def series(set=[], sum=0)
  return 1 if sum == TARGET
  count = 0; base = set[-1] || 1
  (base..TARGET-sum).each do |val|
    count += series(set<<val, sum+val)
  end; count
end
puts series-1

# => 190569291
# real    10m27.852s
# user    10m22.749s
# sys     0m4.844s
