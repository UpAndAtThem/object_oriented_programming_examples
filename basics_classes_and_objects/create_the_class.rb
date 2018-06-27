module Walkable
  def walk
    puts "Lets go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name = "unknown")
    @name = name
  end

  def greet
    "hello my name is #{name}!"
  end
end

kitty = Cat.new("Zanzabar")

kitty.walk
