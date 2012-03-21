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

# modular exponentiation
def mod_pow(base, exp, mod)
  res = 1
  while exp > 0
    odd_exp = exp % 2 == 1
    res = (res * base) % mod if odd_exp
    base = (base * base) % mod
    exp = exp / 2
  end
  return res
end

# solve for n: 0 = an^2 + bn + c
def solve_quad(a, b, c)
  sqrt = Math.sqrt(b**2 - 4*a*c)
  return [(-b + sqrt)/(2*a),
          (-b - sqrt)/(2*a)]
end

# x = n(n+1)/2 => 0 = n^2 + n - 2x
def is_triangle(x)
  solution = solve_quad(1, 1, -2*x)
  solution.max % 1 == 0
end

# x = n(3n-1)/2 => 0 = 3n^2 - n - 2x
def is_pentagonal(x)
  solution = solve_quad(3, -1, -2*x)
  solution.max % 1 == 0
end

# x = n(2n-1) => 0 = 2n^2 - n - x
def is_hexagonal(x)
  solution = solve_quad(2, -1, -x)
  solution.max % 1 == 0
end
