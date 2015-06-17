require __dir__ + '/../app.rb'

RSpec.describe Instruction do

  it "validates input" do
    expect{ Instruction.new("L") }.not_to raise_error
    expect{ Instruction.new("R") }.not_to raise_error
    expect{ Instruction.new("F") }.not_to raise_error

    expect{ Instruction.new("LR") }.to raise_error(ArgumentError)
    expect{ Instruction.new("E") }.to raise_error(ArgumentError)
    expect{ Instruction.new("4") }.to raise_error(ArgumentError)
  end

  context "L" do
    it "adjusts a position's orientation ninety degress anti-clockwise" do
      expect(Instruction.new("L").execute(Position.from_s("1 1 N"))).to eq(Position.from_s("1 1 W"))
      expect(Instruction.new("L").execute(Position.from_s("1 1 E"))).to eq(Position.from_s("1 1 N"))
      expect(Instruction.new("L").execute(Position.from_s("1 1 S"))).to eq(Position.from_s("1 1 E"))
      expect(Instruction.new("L").execute(Position.from_s("1 1 W"))).to eq(Position.from_s("1 1 S"))
    end
  end

  context "R" do
    it "adjusts a position's orientation ninety degress clockwise" do
      expect(Instruction.new("R").execute(Position.from_s("1 1 N"))).to eq(Position.from_s("1 1 E"))
      expect(Instruction.new("R").execute(Position.from_s("1 1 E"))).to eq(Position.from_s("1 1 S"))
      expect(Instruction.new("R").execute(Position.from_s("1 1 S"))).to eq(Position.from_s("1 1 W"))
      expect(Instruction.new("R").execute(Position.from_s("1 1 W"))).to eq(Position.from_s("1 1 N"))
    end
  end

  context "F" do
    it "moves a position forward by one step" do
      expect(Instruction.new("F").execute(Position.from_s("1 1 N"))).to eq(Position.from_s("1 2 N"))
      expect(Instruction.new("F").execute(Position.from_s("1 1 E"))).to eq(Position.from_s("2 1 E"))
      expect(Instruction.new("F").execute(Position.from_s("1 1 S"))).to eq(Position.from_s("1 0 S"))
      expect(Instruction.new("F").execute(Position.from_s("1 1 W"))).to eq(Position.from_s("0 1 W"))
    end
  end
  
end