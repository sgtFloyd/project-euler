# The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
# number, 134217728=8^9, is a ninth power.
#
# How many n-digit positive integers exist which are also an nth power?

power = total = 0
while power += 1
  base = count = 0
  while base += 1
    result = base**power
    digits = Math.log10(result).floor+1
    break if digits > power
    count += 1 if digits == power
  end
  break if count == 0
  total += count
end
puts total

# => 49
# real    0m0.076s
# user    0m0.048s
# sys     0m0.026s
