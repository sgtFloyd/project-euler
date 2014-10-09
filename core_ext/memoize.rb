module Memoize
  def memoize(fn, cache={})
    fxn = self.instance_method(fn)
    define_method fn do |*args|
      cache[[self, *args]] ||=
        fxn.bind(self).call(*args)
    end
  end
  alias :memo :memoize
end
