require_relative 'memoize.rb'

class Fixnum
  extend Memoize

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

end
