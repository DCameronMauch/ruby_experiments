module Memoizable
  module ClassMethods
    def memoize(*methods)
      mixin = Module.new do
        methods.each do |method|
          define_method method do |*args|
            puts 'in mixin'
            @memoizable ||= {}
            @memoizable[method] ||= {}
            @memoizable[method][args] = super(*args) unless @memoizable[method].has_key?(args)
            @memoizable[method][args]
          end
        end
      end

      prepend mixin
    end
  end

  module InstanceMethods
    def clear_memo(method = nil)
      if method
        @memoizable.delete(method)
      else
        @memoizable = nil
      end
      true
    end
  end

  def self.included(klass)
    klass.extend ClassMethods
    klass.include InstanceMethods
  end
end
