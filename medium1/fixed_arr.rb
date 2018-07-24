require 'pry'
# A fixed-length array is an array that always has a fixed number of elements. 
# Write a class that implements a fixed-length array, 
# and provides the necessary methods to support the following code:

class FixedArray

  def initialize(length)
    raise IndexError if length < 0

    @length = length
    @array = Array.new(length)
  end

  def [](index)
    raise IndexError if index >= @array.length
    @array[index] 
  end

  def []=(index, new_value)
    @array[index] = new_value
  end

  def to_a
    @array
  end

  def to_s
    @array.to_s
  end
end


fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

# # The above code should output true 15 times.