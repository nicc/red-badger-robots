require __dir__ + '/../app.rb'

RSpec.describe Position do

  it "sets coordinates and orientation" do
    p = Position.from_s("3 2 N")
    expect(p.x).to eq(3)
    expect(p.y).to eq(2)
    expect(p.orientation).to eq(:N)
  end

  it "validates input" do
    expect{ Position.from_s("3 2 N") }.not_to raise_error
    expect{ Position.from_s("9 22 e") }.not_to raise_error
    expect{ Position.from_s("1 21 S") }.not_to raise_error

    expect{ Position.from_s("21 S") }.to raise_error(ArgumentError)
    expect{ Position.from_s("12 1 R") }.to raise_error(ArgumentError)
    expect{ Position.from_s("11 e") }.to raise_error(ArgumentError)
  end

  it "can represent itself as a string" do
    expect(Position.from_s("3 2 N").to_s).to eq("3 2 N")
  end

  it "evaluates equality" do
    expect(Position.from_s("1 1 W")).to eq(Position.from_s("1 1 W"))
    expect(Position.from_s("1 1 W")).not_to eq(Position.from_s("1 1 E"))
  end
  
end