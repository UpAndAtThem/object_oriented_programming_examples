# Refactoring Vehicles
# Consider the following classes:

class Vehicles
  attr_accessor :make, :model

  def initialize(make, model)
    self.make = make
    self.model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicles
  def wheels
    4
  end
end

class Motorcycle < Vehicles
  def wheels
    2
  end
end

class Truck < Vehicles
  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

f_150 = Truck.new("Ford", "F-150", "5 ton")
probe = Car.new("Ford", "Probe")
ninja = Motorcycle.new("Kawasaki", "Ninja")

# Refactor these classes so they all use a common superclass, and inherit behavior as needed.

