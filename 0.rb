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

# prime factorization
def prime_factor(num)
  pf = []
  (2..Math.sqrt(num).to_i).each do |p|
    break if num == 1
    while num%p == 0
      num /= p
      pf << p
    end
  end
  pf << num unless num == 1
  pf
end

# list of factors
def factor(num)
  pf = prime_factor(num)
  (1..pf.length).inject([]) do |factors, s|
    factors + pf.combination(s).map{|c| c.inject(:*)}
  end.uniq
end

class Fixnum
  # convert self to a base (between 1 and 9)
  def base(b)
    return '' if self == 0
    return "#{(self/b).base(b)}#{self%b}".to_i
  end
end

# determine if string is palindromic
def pal?(str)
  return false if str[0] != str[-1]
  return true if str.length < 2
  return pal?(str[1..-2])
end
