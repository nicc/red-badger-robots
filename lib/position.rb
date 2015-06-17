class Position
  attr_reader :x, :y, :orientation

  VALID_STRING = /^\d{1,2} \d{1,2} [neswNESW]$/

  def self.from_s(position_string)
    raise ArgumentError.new("Expected valid position string, e.g: 3 2 N") unless valid?(position_string)
    self.new(*position_string.split(" "))
  end

  def initialize(x, y, orientation)
    @x = x.to_i
    @y = y.to_i
    @orientation = orientation.capitalize.to_sym
  end

  # for testing
  def ==(another_position)
    [x, y, orientation] == [another_position.x, another_position.y, another_position.orientation]
  end

  private
  def self.valid?(position_string)
  	return position_string.match(VALID_STRING)
  end
end