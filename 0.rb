$primes = [false, false, true] # initial values
# memoized, optimized sieve of eratosthenes
def sieve(n)
  lower = $primes.length
  $primes += [true, false] * ((n-lower)/2+1) if n+1 > lower
  (3..Math.sqrt(n)).each do |i|
    (3*i..n).step(2*i).each do |j|
      $primes[j] = false
    end if $primes[i]
  end
  $primes.map.with_index{|t, i| i if t}.compact
end
