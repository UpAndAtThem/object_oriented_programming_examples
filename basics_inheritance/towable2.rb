# Using the following code, create a class named Vehicle 
# that, upon instantiation, assigns the passed in argument to @year. 
# Both Truck and Car should inherit from Vehicle.

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Vehicle
  attr_accessor :year

  def initialize(year)
    self.year = year
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end
