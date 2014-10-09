class String

  def palindrome?
    return false if self[0] != self[-1]
    return true if self.length < 2
    self[1...-1].palindrome?
  end

end
