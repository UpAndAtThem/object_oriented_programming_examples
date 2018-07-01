# Using the following code, create a class named Cat 
# that prints a greeting when #greet is invoked. 
# The greeting should include the name and color of the cat. 
# Use a constant to define the color.

class Cat
  attr_accessor :color, :name

  def initialize(color, name)
    self.name = name
    self.color = color
  end

  def greet
    puts "Hello, my name is #{self.name}! I'm #{self.color}."
  end
end

kitty = Cat.new('calico', 'Sophie')
kitty.greet

# Expected output:

# Hello! My name is Sophie and I'm a purple cat!