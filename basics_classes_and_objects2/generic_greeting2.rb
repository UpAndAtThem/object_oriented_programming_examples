# Using the following code, add two methods: ::generic_greeting and #personal_greeting. 
# The first method should be a class method and print a greeting that's generic to the class. 
# The second method should be an instance method and print a greeting that's custom to the object.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    "Hey, this is the #{self} class!"
  end

  def personal_greeting
    "Hey #{name}, What's good?"
  end
end

kitty = Cat.new('Sophie')

p Cat.generic_greeting
p kitty.personal_greeting

# Expected output:

# Hello! I'm a cat!
# Hello! My name is Sophie!