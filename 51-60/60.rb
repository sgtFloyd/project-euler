# The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes
# and concatenating them in any order the result will always be prime. For
# example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four
# primes, 792, represents the lowest sum for a set of four primes with this
# property.
#
# Find the lowest sum for a set of five primes for which any two primes
# concatenate to produce another prime.

require_relative '../euler.rb'; include Euler
require_relative '../core_ext/fixnum'

TARGET_TUPLE_SIZE = 5
# Upper bound on the final tuple's sum to narrow our search space.
TUPLE_SUM_THRESHOLD = 30_000

# Does `prime` form a "remarkable pair" with each member of `tuple`?
def remarkable?(tuple, prime)
  tuple.all? do |t|
    prime?(t.concat(prime)) && prime?(prime.concat(t))
  end
end

# The maximum possible value for the next prime in a given sequence.
def upper_limit(tuple)
  (TUPLE_SUM_THRESHOLD - tuple.inject(&:+)) / (TARGET_TUPLE_SIZE - tuple.length)
end

@remarkable_tuples = Hash.new{|hash, key| hash[key] = []}
# Assume the first prime will be under 100.
@remarkable_tuples[1] = sieve(100).map(&method(:Array))

[2, 3, 4, 5].each do |tuple_size|
  @remarkable_tuples[tuple_size - 1].each do |tuple|
    sieve(upper_limit(tuple), tuple.max).each do |prime|
      @remarkable_tuples[tuple_size] << [*tuple, prime] if remarkable?(tuple, prime)
    end
  end
  @remarkable_tuples[tuple_size].map!(&:sort).uniq!
  puts "#{@remarkable_tuples[tuple_size].length} remarkable tuples of length #{tuple_size}"
end

puts @remarkable_tuples[5].map{|quintet| quintet.inject(&:+)}.min

# => 26033
# real  0m14.392s
# user  0m14.243s
# sys   0m0.053s
