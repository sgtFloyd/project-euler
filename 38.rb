# Take the number 192 and multiply it by each of 1, 2, and 3:
#
#   192 x 1 = 192
#   192 x 2 = 384
#   192 x 3 = 576
#
# By concatenating each product we get the 1 to 9 pandigital,
# 192384576. We will call 192384576 the concatenated product
# of 192 and (1,2,3)
#
# The same can be achieved by starting with 9 and multiplying
# by 1, 2, 3, 4, and 5, giving the pandigital, 918273645,
# which is the concatenated product of 9 and (1,2,3,4,5).
#
# What is the largest 1 to 9 pandigital 9-digit number that
# can be formed as the concatenated product of an integer with
# (1,2, ... , n) where n > 1?

def pandigital?(a)
  a.join.split('').sort.join == '123456789'
end

max = -1
(1000..9999).each do |i|
  n = 1; products = [*1..n].map{|m| m*i}
  while products.join.size < 9
    n += 1; products = [*1..n].map{|m| m*i}
    max = products.join.to_i if pandigital?(products) && max < products.join.to_i
  end
end
puts max

# => 932718654
