# Using the following code, add the appropriate accessor methods. 
# Keep in mind that the last_name getter shouldn't be visible outside the class, 
# while the first_name getter should be visible outside the class.

class Person
  attr_reader :first_name
  attr_writer :first_name, :last_name

  def first_equals_last?
    first_name == last_name
  end

  private
  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Dave'

puts person1.first_equals_last?

# Expected output:

# false