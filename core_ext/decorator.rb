module Decorator
  def decorate_method(fn, &block)
    fxn = instance_method(fn)
    define_method fn do |*args|
      instance_exec(fxn.bind(self), *args, &block)
    end
  rescue NameError, NoMethodError
    fxn = singleton_class.instance_method(fn).bind(self)
    define_singleton_method fn do |*args|
      instance_exec(fxn, *args, &block)
    end
  end
end
