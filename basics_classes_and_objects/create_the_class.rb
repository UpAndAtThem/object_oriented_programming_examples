# class Cat
#   def initialize(name = "unknown")
#     @name = name
#   end

#   def name
#     @name
#   end

#   def name=(name)
#     @name = name
#   end

#   def greet
#     "hello my name is #{name}!"
#   end
# end

class Cat
  attr_accessor :name

  def initialize(name = "unknown")
    @name = name
  end

  def greet
    "hello my name is #{name}!"
  end
end

kitty = Cat.new()
