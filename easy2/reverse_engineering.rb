# Reverse Engineering
# Write a class that will display:

# ABC
# xyz
# when the following code is run:

class Transform
  attr_accessor :string

  def initialize(string)
    self.string = string
  end

  def uppercase
    self.string = string.upcase
  end

  def lowercase
    self.string = string.downcase 
  end

  def self.lowercase(string)
    string.downcase
  end

  def self.uppercase(string)
    string.upcase
  end
end

my_data = Transform.new('ABC')
puts my_data.lowercase
puts Transform.uppercase('XYZ')