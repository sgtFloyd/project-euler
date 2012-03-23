# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include leading zeros.)

class Fixnum
  # convert self to a base (between 1 and 9)
  def base(b)
    return '' if self == 0
    return "#{(self/b).base(b)}#{self%b}".to_i
  end
end

def pal?(str)
  str = str.to_s
  return false if str[0] != str[-1]
  return true if str.length < 2
  return pal?(str[1..-2])
end

puts (1...1_000_000).inject(0) do |sum, n|
  sum + (pal?(n) && pal?(n.base(2)) ? n : 0)
end

# => 872187
