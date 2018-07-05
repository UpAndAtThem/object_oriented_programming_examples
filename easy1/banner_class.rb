class Banner
  attr_accessor :message

  def initialize(message)
    self.message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * message.length}-+"
  end

  def empty_line
    "|#{" " * (message.length + 2)}|"
  end

  def message_line
    "| #{message} |"
  end
end

new_banner = Banner.new("Welcome to ThunderDome!")

puts new_banner.to_s
