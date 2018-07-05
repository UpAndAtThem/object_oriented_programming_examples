class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new # create a new instance of the Something object assigned to thing
puts Something.dupdata  # puts will print the return of the class method dupdate which is the strig "ByeBye"
puts thing.dupdata # puts will print the return of the instance method dupdata which is the instance var @date concatenated with itself

# output:

# "ByeBye"
# "HelloHello"