#Consider the following class:

class Machine
  attr_reader :switch

  def initialize(state)
    @switch = state
  end

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def toggle
    opposite = self.switch == :on ? :off : :on
    flip_switch(opposite)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

blender = Machine.new(:on)

blender.stop
p blender
blender.start
p blender

#Modify this class so both flip_switch and the setter method switch= are private methods.