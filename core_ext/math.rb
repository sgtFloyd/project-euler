require_relative 'fixnum'

module Math
  def self.solve_quad(a,b,c)
    sqrt = sqrt(b**2 - 4*a*c)
    return [(-b + sqrt)/(2*a),
            (-b - sqrt)/(2*a)]
  end

  def self.reduce_fraction(fraction)
    numerator, denominator =
      fraction.split('/').map(&:to_i)
    gcd = numerator.gcd(denominator)
    unless gcd == 1
      numerator /= gcd
      denominator /= gcd
    end
    "#{numerator}/#{denominator}"
  end

  def self.nth_triangle(n)
    n*(n+1)/2
  end

  def self.nth_pentagonal(n)
    n*(3*n-1)/2
  end

  def self.nth_hexagonal(n)
    n*(2*n-1)
  end
end
