# An irrational decimal fraction is created by concatenating the positive integers:
#
#   0.12345678910*1*12131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the following expression.
#
# d(1) * d(10) * d(100) * d(1000) * d(10000) * d(100000) * d(1000000)

def d(n)
  decimal = ''; i=1
  (decimal << i.to_s; i+=1) while decimal.length < n
  decimal[n-1].to_i
end

puts d(1) * d(10) * d(100) * d(1000) * d(10000) * d(100000) * d(1000000)

# => 60744
# real    0m0.089s
# user    0m0.056s
# sys     0m0.003s
