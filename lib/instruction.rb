class Instruction
  attr_reader :input

  VALID_STRING = /^[lrfLRF]$/

  def initialize(instruction_string)
  	raise ArgumentError.new("Expected valid instruction: [L,R,F]") unless valid?(instruction_string)
    @input = instruction_string.capitalize.to_sym
  end

  def execute(position)
    return Instruction[input].call(position)
  end

  private
  def valid?(instruction_string)
  	return instruction_string.match(VALID_STRING)
  end

  def self.[](instruction)
    {
      L: ->(position) { Position.new(position.x, position.y, Orientation.left_of(position.orientation)) },
      R: ->(position) { Position.new(position.x, position.y, Orientation.right_of(position.orientation)) },
      F: ->(position) do
        x, y = Movement.for(position.orientation).call(position.x, position.y)
        Position.new(x,y, position.orientation)
      end
    }[instruction]
  end



  
end