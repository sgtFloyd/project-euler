class Array

  def frequency
    each_with_object(Hash.new(0)){|v, h| h[v] += 1}
  end

end
