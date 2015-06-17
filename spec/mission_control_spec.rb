require __dir__ + '/../app.rb'

RSpec.describe MissionControl do

  it "reads instructions" do
    s = %q(
      5 3
      1 1 E
      RFRFRFRF

      3 2 N
      FRRFLLFFRRFLL

      0 3 W
      LLFFFLFLFL
    )

    mc = MissionControl.new(s)
    expect(mc.map.x).to eq(5)
    expect(mc.map.y).to eq(3)
    expect(mc.expeditions.map{|e| e[0].position.to_s }).to eq(["1 1 E", "3 2 N", "0 3 W"])
    expect(mc.expeditions.map{|e| e[1] }).to eq(["RFRFRFRF", "FRRFLLFFRRFLL", "LLFFFLFLFL"])
  end
  
end