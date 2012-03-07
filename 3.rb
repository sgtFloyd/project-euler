# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

# Sieve of Eratosthenes
#    Input: an integer n > 1
#
#    Let A be an array of Boolean values, indexed by integers 2 to n,
#    initially all set to true.
#
#    for i = 2, 3, 4, ..., while i ² n/2:
#      if A[i] is true:
#        for j = 2i, 3i, 4i, ..., while j ² n:
#          A[j] := false
#
#    Now all i such that A[i] is true are prime.
def sieve(n)
  a = Array.new(n, true)
  a[0] = a[1] = false
  (2..n/2).each do |i|
    (2*i..n).step(i).each do |j|
      a[j] = false
    end if a[i]
  end
  a.map.with_index{|t, i| i if t}.compact
end

num = 600851475143
sieve( Math.sqrt(num).to_i ).each do |prime|
  puts prime if num%prime==0
end
