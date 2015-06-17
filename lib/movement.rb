#  these are little coordinate modifier closures for movement
class Movement
  def self.for(orientation, steps=1)
    {
      N: ->(x,y) { [x, y+steps] },
      E: ->(x,y) { [x+steps, y] },
      S: ->(x,y) { [x, y-steps] },
      W: ->(x,y) { [x-steps, y] },
    }[orientation]
  end
end