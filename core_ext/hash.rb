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
