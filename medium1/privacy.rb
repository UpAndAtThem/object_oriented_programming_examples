#Consider the following class:

class Machine
  attr_reader :switch

  def initialize(state)
    @switch = state
  end

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def toggle
    opposite = self.switch == :on ? :off : :on
    @switch = flip_switch(opposite)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

#Modify this class so both flip_switch and the setter method switch= are private methods.