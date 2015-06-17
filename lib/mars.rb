class Mars
  attr_reader :x, :y, :scents

	def initialize(x,y)
    raise ArgumentError.new("Mars is made of integers, please") unless [x,y].all? {|a| a.is_a?(Integer) }
    raise ArgumentError.new("Mars can't be taller or wider than 50") unless [x,y].all? {|i| i <= 50 }
    @x = x
    @y = y
    @scents = []
  end

  def off_planet?(position)
    position.x > x || position.y > y
  end

  def has_scent_at?(position)
    @scents.include? position.to_s
  end

  def add_scent(position)
    @scents.push position.to_s
  end
end