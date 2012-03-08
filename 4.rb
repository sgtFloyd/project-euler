# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 x 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

# return true if string is palindrome
def pal?(str)
  return false if str[0] != str[-1]
  return true if str.length < 2
  return pal?(str[1..-2])
end

# return the greatest 3-digit divisor of num
def gd(num)
  sqrt = Math.sqrt(num).to_i
  sqrt.downto(100).each{|i|
    return i if num%i == 0 && num/i < 1000
  }
  return
end

(999*999).downto(100*100).each{|i|
  next unless pal?(i.to_s)
  (puts i; break) if gd(i)
}

# => 906609
# real  0m0.068s
# user  0m0.064s
# sys   0m0.003s