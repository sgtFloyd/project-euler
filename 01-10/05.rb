# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

RANGE = (11..20)

def divis?(num)
  RANGE.each{|i| return false if num%i != 0 }
  return true
end

val = [*RANGE].inject(:*)
RANGE.each do |divisor|
  val /= divisor while divis?(val/divisor)
end
puts val

# => 232792560
# real    0m0.008s
# user    0m0.005s
# sys     0m0.002s