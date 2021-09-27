module RobotSimulator
  class Position
    attr_reader :x_coordinate, :y_coordinate, :direction

    def initialize(x_coordinate, y_coordinate, direction)
      @x_coordinate = x_coordinate
      @y_coordinate = y_coordinate
      @direction = direction
      @coordinates = Coordinates
    end

    def move_forward
      new_x_coordinate = @x_coordinate + @coordinates.step(@direction, :forward_x)
      new_y_coordinate = @y_coordinate + @coordinates.step(@direction, :forward_y)

      new_position(new_x_coordinate, new_y_coordinate, @direction)
    end

    def turn(turn_side)
      new_direction = @coordinates.direction(@direction, turn_side)

      new_position(@x_coordinate, @y_coordinate, new_direction)
    end

    def new_position(x_coordinate, y_coordinate, direction)
      Position.new(x_coordinate, y_coordinate, direction)
    end
  end
end
