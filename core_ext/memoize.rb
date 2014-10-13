module Memoize
  def memoize(fn, cache: {})
    fxn = self.instance_method(fn)
    define_method fn do |*args, &block|
      cache[[self, *args]] ||=
        fxn.bind(self).call(*args, &block)
    end
  rescue NameError, NoMethodError
    fxn = singleton_class.instance_method(fn)
    define_singleton_method fn do |*args, &block|
      cache[args] ||=
        fxn.bind(self).call(*args, &block)
    end
  end
  alias :memo :memoize
end
extend Memoize # memoization for main:Object
