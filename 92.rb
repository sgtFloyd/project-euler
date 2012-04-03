# A number chain is created by continuously adding the square of
# the digits in a number to form a new number until it has been
# seen before.
#
# For example,
#
#   44 -> 32 -> 13 -> 10 -> 1 -> 1 ...
#   85 -> 89 -> 145 -> 42 -> 20 -> 4 -> 16 -> 37 -> 58 -> 89 -> ...
#
# Therefore any chain that arrives at 1 or 89 will become stuck in
# an endless loop. What is most amazing is that EVERY starting
# number will eventually arrive at 1 or 89.
#
# How many starting numbers below ten million will arrive at 89?

$memo = {1 => 1, 89 => 89}
def chain(n)
  return chain(sum_dig(n)) if n > 567 # memoize under 567 => sum_dig(9_999_999)
  $memo[n] ||= chain(sum_dig(n))
end

def sum_dig(n)
  sum = 0
  while n >= 10
    n, dig = n.divmod(10)
    sum += dig ** 2
  end
  sum + n ** 2
end

puts [*1...10_000_000].select{|n| chain(n) == 89}.count

# => 8581146
# real    1m54.263s
# user    1m53.749s
# sys     0m0.598s
