class MissionControl
  attr_reader :map, :expeditions

	def initialize(instruction_string)
    instructions = instruction_string.split( /\r?\n/ ).map(&:strip).reject{|s| s == "" }

    @map = Mars.from_s(instructions.shift)

    robot_instructions = instructions.each_slice(2).to_a
    @expeditions = robot_instructions.map{|a| [Robot.new(map, a[0]), a[1]] }
	end

  def execute!
    expeditions.each do |expedition|
      robot, instructions = expedition

      instructions.split("").each{|i| robot.execute(i) }
      puts "#{robot.position} #{robot.off_planet? ? 'LOST' : ''}\n"
    end
  end

end