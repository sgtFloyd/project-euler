# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

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

puts sieve(2_000_000).inject(0){|sum, i| sum + i}

# => 142913828922
# real    0m1.198s
# user    0m1.170s
# sys     0m0.025s