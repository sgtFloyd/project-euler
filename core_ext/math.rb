require_relative 'fixnum'

module Math
  def self.solve_quad(a,b,c)
    sqrt = sqrt(b**2 - 4*a*c)
    return [(-b + sqrt)/(2*a),
            (-b - sqrt)/(2*a)]
  end

  # Reduce a proper fraction to its lowest terms
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

  # Simplify a complex fraction to an improper, non-complex fraction
  def self.simplify_fraction(fraction)
    nominators = fraction.split('/').map(&:to_i)
    while nominators.count > 2
      nominators[-2] = nominators.pop * nominators[-2]
    end
    nominators.join('/')
  end

  def self.nth_triangle(n)
    n*(n+1)/2
  end

  def self.nth_square(n)
    n*n
  end

  def self.nth_pentagonal(n)
    n*(3*n-1)/2
  end

  def self.nth_hexagonal(n)
    n*(2*n-1)
  end

  def self.nth_heptagonal(n)
    n*(5*n-3)/2
  end

  def self.nth_octagonal(n)
    n*(3*n-2)
  end
end
