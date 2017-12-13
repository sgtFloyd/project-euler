# require_relative '../euler.rb'; include Euler
module Euler

  # Memoized, optimized Sieve of Eratosthenes.
  $_primes = [false, false, true] # initial values
  def sieve(upper_bound, lower_bound=0)
    if $_primes.length < (upper_bound + 1)
      # Initialize even indices to false (non-prime), odd indices to true (maybe-prime)
      $_primes += [true, false] * ((upper_bound - $_primes.length) / 2 + 1)

      (3..Math.sqrt(upper_bound)).each do |i|
        (3*i..upper_bound).step(2*i).each do |j|
          $_primes[j] = false
        end if $_primes[i]
      end
    end

    range = $_primes[lower_bound..upper_bound]
    range.map.with_index do |is_prime, index|
      index + lower_bound if is_prime
    end.compact
  end

  # miller-rabin primality test
  def miller_rabin(n)
    d = n - 1; s = 0
    while d % 2 == 0
     d >>= 1; s += 1
    end
    potential_witnesses(n).each do |a|
      return false unless witness(a, s, d, n)
    end
    return true
  end
  alias_method :prime?, :miller_rabin

  # test primality of n using a single witness
  def witness(a, s, d, n)
    a_to_power = mod_pow(a, d, n)
    return true if a_to_power == 1
    s.times do
      return true if a_to_power == n-1
      a_to_power = (a_to_power * a_to_power) % n
    end
    return a_to_power == n-1
  end

  # allows deterministic miller-rabin results for values of n < 341,550,071,728,321
  def potential_witnesses(n)
    return [2, 3]                   if n < 1373653
    return [31, 73]                 if n < 9080191
    return [2, 7, 61]               if n < 4759123141
    return [2, 3, 5, 7, 11]         if n < 2152302898747
    return [2, 3, 5, 7, 11, 13]     if n < 3474749660383
    return [2, 3, 5, 7, 11, 13, 17] if n < 341550071728321
    20.times.map{ rand(1..n-1) }
  end

  $factorials = [1]
  # memoized, recursive factorial solutions
  def factorial(n)
    $factorials[n] ||= n*factorial(n-1)
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

  # solve quadratic equation
  def solve_quad(a, b, c)
    sqrt = Math.sqrt(b**2 - 4*a*c)
    return [(-b + sqrt)/(2*a),
            (-b - sqrt)/(2*a)]
  end

  # calculate the nth triangle number
  def triangle(n)
    n*(n+1)/2
  end

  # determine if x is a triangle number
  def triangle?(x)
    # x = n(n+1)/2 => 0 = n^2 + n - 2x
    solution = solve_quad(1, 1, -2*x)
    solution.max % 1 == 0
  end

  # calculate the nth pentagonal number
  def pentagonal(n)
    n*(3*n-1)/2
  end

  # determine if x is pentagonal
  def pentagonal?(x)
    # x = n(3n-1)/2 => 0 = 3n^2 - n - 2x
    solution = solve_quad(3, -1, -2*x)
    solution.max % 1 == 0
  end

  # calculate the nth hexagonal number
  def hexagonal(n)
    n*(2*n-1)
  end

  # determine if x is hexagonal
  def hexagonal?(x)
    # x = n(2n-1) => 0 = 2n^2 - n - x
    solution = solve_quad(2, -1, -x)
    solution.max % 1 == 0
  end

  # prime factorization
  def prime_factors(num)
    pf = []
    sieve(Math.sqrt(num)).each do |p|
      break if num == 1
      while num%p == 0
        num /= p
        pf << p
      end
    end
    pf << num unless num == 1
    pf
  end

  # list all factors of num
  def factors(num)
    pf = prime_factors(num)
    (1..pf.length).inject([]) do |factors, s|
      factors + pf.combination(s).map{|c| c.inject(:*)}
    end.uniq
  end

  # determine if string is palindromic
  def palindrome?(str)
    str = str.to_s
    return false if str[0] != str[-1]
    return true if str.length < 2
    return palindrome?(str[1..-2])
  end

  # determine if a list of numbers is pandigital based on range
  def pandigital?(str, range)
    str = str.join if Array === str
    str.to_s.split('').sort.join == [*range].join
  end

  # determine if two string are anagrams of eachother
  def anagram?(a, b)
    a.to_s.split('').sort == b.to_s.split('').sort
  end

  # determine if a number is a square
  def square?(num)
    Math.sqrt(num) % 1 == 0
  end

  # determine if a number is composite
  def composite?(n)
    return false if n == 2
    return true if n<2 || n%2 == 0
    (3..Math.sqrt(n)).step(2).each do |d|
      return true if n%d == 0
    end
    false
  end

  # greatest common denominator
  def gcd(a, b)
    return b if a==0
    return gcd(b%a, a)
  end

  # euler's totient function
  # the number of integers i coprime to x for i < x
  def phi(x)
    prime_factors(x).uniq
      .inject(x){|x, k| x - x/k}
  end

  def data_file(fname)
    File.open(File.join(File.expand_path(File.dirname(__FILE__)), "data/#{fname}"))
  end

end

class Object
  def try(*a, &b)
    __send__(*a, &b) unless self.nil?
  end
  def in?(collection)
    collection.include?(self)
  end
  def blank?
    respond_to?(:empty?) ? !!empty? : !self
  end
  def present?
    !blank?
  end
  def presence
    self if present?
  end
end

class Hash
  def slice(*keys)
    keys.each_with_object({}) do |k, hash|
      hash[k] = self[k] if has_key?(k)
    end
  end
  def except(*keys)
    dup.except!(*keys)
  end
  def except!(*keys)
    keys.each {|key| delete(key)}
    self
  end
end

class Array
  def frequency
    each_with_object(Hash.new(0)){|v, h| h[v] += 1 }
  end
end

class Fixnum
  # convert to a base between 2 and 9
  def base(b)
    return '' if self == 0
    return "#{(self/b).base(b)}#{self%b}".to_i
  end

  def choose(r)
    self.! / (r.! * (self-r).!)
  end

  def !
    $factorials[self] ||= self * (self-1).!
  end
end
