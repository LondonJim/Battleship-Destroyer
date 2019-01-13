class Ship

  attr_reader :size

  attr_accessor :x_coordinate, :y_coordinate, :direction

  def initialize(size)
    @size = size
    @x_coordinate = nil
    @y_coordinate = nil
    @direction = nil
  end

end
