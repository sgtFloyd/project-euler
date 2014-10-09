class Object
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

  def try(*a, &b)
    public_send(*a, &b) unless self.nil?
  end
end
