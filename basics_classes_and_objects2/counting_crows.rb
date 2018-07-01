# Using the following code, create a class named Crow 
# that tracks the number of times a new Crow object is instantiated. 
# The total number of Crow instances should be printed when #total is invoked.

class Crow
  @@murder_count = 0

  def initialize
    @@murder_count += 1
  end

  def self.total
    binding.pry
    murder_count
  end
end

kitty1 = Crow.new
kitty2 = Crow.new

Crow.total

# Expected output:
# 2