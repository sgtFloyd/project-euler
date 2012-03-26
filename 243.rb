# A positive fraction whose numerator is less than its denominator is called a proper fraction.
# For any denominator, d, there will be d-1 proper fractions; for example, with d = 12:
#   1/12, 2/12, 3/12, 4/12, 5/12, 6/12, 7/12, 8/12, 9/12, 10/12, 11/12
#
# We shall call a fraction that cannot be cancelled down a resilient fraction.
# Furthermore we shall define the resilience of a denominator, R(d), to be the ratio of its
# proper fractions that are resilient; for example, R(12) = 4/11 .
# In fact, d = 12 is the smallest denominator having a resilience R(d) < 4/10 .
#
# Find the smallest denominator d, having a resilience R(d) < 15499/94744.

require './euler.rb'; include Euler

TARGET = 15499.0 / 94744

def resilience(d)
  phi(d) / (d-1.0)
end

base = 2; last_prime = 2; mult = 1
while resilience(base*mult) >= TARGET
  mult += 1
  if mult > last_prime && prime_factors(mult) == [mult]
    last_prime = mult
    base *= last_prime
    mult = 1
  end
end

puts base * mult

# => 892371480
# real    0m0.103s
# user    0m0.098s
# sys     0m0.004s