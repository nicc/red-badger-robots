class Robot
  attr_reader :map, :position, :off_planet

  def initialize(map, position_string)
    @map = map
    @position = Position.from_s(position_string)
    @off_planet = @map.off_planet?(position)
  end

  def off_planet?
    @off_planet
  end

  private
  def execute(instruction_string)
    return if off_planet? # ignore off-planet instructions
    return if instruction_string == "F" && @map.has_scent_at?(position) # ignore terrible orders

    instruction = Instruction.new(instruction_string)
    new_position = instruction.execute(position)

    if @map.off_planet?(new_position)
      @off_planet = true
      # keep old position when going off-planet
      @map.add_scent position.to_s
    else
      @position = new_position
    end
  end
end