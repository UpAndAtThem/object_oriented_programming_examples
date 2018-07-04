# Create a module named Transportation that contains three classes: 
# Vehicle, Truck, and Car. 
# Truck and Car should both inherit from Vehicle.

module Transportation
  class Vehicle
    attr_accessor :year, :color, :transmission_type, :model

    def initialize(year, color, transmission_type, model)
      self.year = year
      self.color = color
      self.transmission_type = transmission_type
      self.model = model
    end
  end

  class Truck < Vehicle

  end

  class Car < Vehicle

  end
end

probe = Transportation::Car.new(1992, "red", "manual", "Probe")
f_150 = Transportation::Truck.new(2004, "white", "manual", "F-150")
