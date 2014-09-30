#!/usr/bin/env ruby

module Mixin
  def test
    puts 'in mixin'
    super
  end
end

class Parent
  def test
    puts 'in parent'
  end
end

class ChildPlain < Parent
  def test
    puts 'in child'
    super
  end
end

class ChildInclude < Parent
  include Mixin

  def test
    puts 'in child'
    super
  end
end

class ChildPrepend < Parent
  prepend Mixin

  def test
    puts 'in child'
    super
  end
end

puts '--- child plain ---'
ChildPlain.new.test

puts
puts '--- child include ---'
ChildInclude.new.test

puts
puts '--- child prepend ---'
ChildPrepend.new.test
