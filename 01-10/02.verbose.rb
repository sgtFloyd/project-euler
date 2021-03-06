# Each new term in the Fibonacci sequence is generated by adding the previous
# two terms. By starting with 1 and 2, the first 10 terms will be:
#
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci sequence whose values do not
# exceed four million, find the sum of the even-valued terms.

last_last_val = 0
last_val = 1

sum = 0
while true
  next_val = last_val + last_last_val
  break if next_val > 4_000_000
  if next_val % 2 == 0
    sum += next_val
  end
  last_last_val = last_val
  last_val = next_val
end
puts sum

# => 4613732
# real  0m0.043s
# user  0m0.032s
# sys   0m0.008s
