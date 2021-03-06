require_relative 'math'
require_relative 'memoizer'

class Fixnum
  extend Memoizer

  def base(b)
    raise ArgumentError if b<2 || b>10
    return self if self < b
    "#{(self/b).base(b)}#{self%b}".to_i
  end

  def choose(r)
    self.factorial / (r.factorial * (self-r).factorial)
  end

  memo def factorial
    return 1 if self == 0
    self * (self-1).factorial
  end

  def mod_pow(exp, mod)
    return 1          if exp == 0
    return self % mod if exp == 1
    exp.even? ? mod_pow(exp/2, mod)**2 % mod
      : self * mod_pow(exp-1, mod) % mod
  end

  def square?
    Math.sqrt(self) % 1 == 0
  end

  def triangle?
    # x = n(n+1)/2 => 0 = n^2 + n - 2x
    solutions = Math.solve_quad(1, 1, -2*self)
    solutions.max % 1 == 0
  end

  def pentagonal?
    # x = n(3n-1)/2 => 0 = 3n^2 - n - 2x
    solutions = Math.solve_quad(3, -1, -2*self)
    solutions.max % 1 == 0
  end

  def hexagonal?
    # x = n(2n-1) => 0 = 2n^2 - n - x
    solutions = solve_quad(2, -1, -self)
    solutions.max % 1 == 0
  end

  def digits
    return [self] if self < 10
    base, digit = self.divmod(10)
    base.digits.push digit
  end

  def bouncy?
    pairs = digits.each_cons(2)
    pairs.any?{|a,b| a<b} && pairs.any?{|a,b| a>b}
  end

  def concat(n)
    (self.to_s << n.to_s).to_i
  end

end
