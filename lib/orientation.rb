class Orientation
	COMPASS = %i{ N E S W }
	
	def self.left_of(orientation)
    current_index = COMPASS.index(orientation)
    return COMPASS[current_index-1]
  end

  def self.right_of(orientation)
    current_index = COMPASS.index(orientation)
    return COMPASS[current_index+1] || COMPASS.first
  end
end