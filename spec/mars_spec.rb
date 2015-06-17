require __dir__ + '/../app.rb'

RSpec.describe Mars do

  it "validates input" do
    expect{ Mars.new(1, 1) }.not_to raise_error

    expect{ Mars.new("1", "2") }.to raise_error(ArgumentError)
    expect{ Mars.new(1, 51) }.to raise_error(ArgumentError)
    expect{ Mars.new(51, 2) }.to raise_error(ArgumentError)
  end

  it "determines if a position is off-planet" do
    m = Mars.new(10,10)

    expect(m.off_planet?(Position.from_s("5 1 N"))).to be false
    expect(m.off_planet?(Position.from_s("11 1 N"))).to be true
    expect(m.off_planet?(Position.from_s("1 11 N"))).to be true
  end

  it "keeps scents to mitigate terrible leadership" do
    mars = Mars.new(5,5)
    position = Position.from_s("3 5 N")
    expect(mars.has_scent_at?(position)).to be false
    mars.add_scent(position)
    expect(mars.has_scent_at?(position)).to be true
  end
  
end