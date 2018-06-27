class Cat
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def greet
    "hello my name is #{name}!"
  end
end

kitty = Cat.new("Sophie")

p kitty.greet