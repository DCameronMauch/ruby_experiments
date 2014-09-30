class Thing < ActiveRecord::Base
  include Memoizable

  memoize :foo, :bar, :nothing

  def foo
    puts 'in class'
    'foo'
  end

  def bar(*strings)
    puts 'in class'
    strings.append('bar').join(' ')
  end

  def nothing
    puts 'in class'
    nil
  end
end
