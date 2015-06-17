require __dir__ + '/../app.rb'

RSpec.describe Robot do

  before(:each) do
    @mars = Mars.new(10,10)
  end

  it "follows instructions" do
    robot = Robot.new(@mars, "5 5 N")
    robot.send(:execute, "F")
    expect(robot.position).to eq(Position.from_s("5 6 N"))

    robot.send(:execute, "L")
    robot.send(:execute, "R")
    robot.send(:execute, "L")
    expect(robot.position).to eq(Position.from_s("5 6 W"))

    robot.send(:execute, "F")
    expect(robot.position).to eq(Position.from_s("4 6 W"))
  end

  it "recognises when it goes off-planet" do
    robot = Robot.new(@mars, "5 9 N")
    robot.send(:execute, "F")
    expect(robot).not_to be_off_planet
    robot.send(:execute, "F")
    expect(robot).to be_off_planet
  end

  it "marks the map when it goes off planet" do
    robot = Robot.new(@mars, "5 10 N")
    expect(robot).not_to be_off_planet
    position = robot.position

    expect(@mars.has_scent_at?(position)).to be false
    robot.send(:execute, "F")
    expect(robot).to be_off_planet
    expect(@mars.has_scent_at?(position)).to be true
  end

  it "disobeys when instructed to perform an instruction known to take it off-planet" do
    robot = Robot.new(@mars, "5 10 N")
    expect(robot).not_to be_off_planet
    position = robot.position
    @mars.add_scent(position)

    robot.send(:execute, "F")
    expect(robot).not_to be_off_planet
    expect(robot.position).to eq(position)
  end

  it "still turns on scented positions" do
    robot = Robot.new(@mars, "5 10 N")
    expect(robot).not_to be_off_planet
    position = robot.position
    @mars.add_scent(position)

    robot.send(:execute, "L")
    expect(robot).not_to be_off_planet
    expect(robot.position).to eq(Position.from_s("5 10 W"))
  end

  context "off-planet" do
    it "ignores instructions" do
      robot = Robot.new(@mars, "5 10 N")
      expect(robot.position).to eq(Position.from_s("5 10 N"))
      expect(robot).not_to be_off_planet
      
      robot.send(:execute, "F")
      robot.send(:execute, "F")
      robot.send(:execute, "F")

      expect(robot).to be_off_planet
      expect(robot.position).to eq(Position.from_s("5 10 N"))
    end
  end
  
end