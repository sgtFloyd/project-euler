require_relative 'decorator'

module Memoizer
  include Decorator

  def memoize(fn, cache: Hash.new{|h,k|h[k]={}})
    decorate_method(fn) do |meth, *args|
      unless cache[self].include?(args)
        cache[self][args] = meth.call(*args)
      end
      cache[self][args]
    end
  end
  alias :memo :memoize
end
