module Memoize
  def memoize(fn)
    cache = {}
    fxn = self.instance_method(fn)
    define_method fn do |*args|
      unless cache.include?(args)
        cache[args] = fxn.bind(self).call(*args)
      end
      cache[args]
    end
  end
  alias :memo :memoize
end
