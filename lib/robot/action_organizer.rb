module RobotSimulator
  class ActionOrganizer
    def initialize(options = {})
      @robot = options[:robot]
    end

    def place(place_position)
      place_array = place_position.split(',')
      x_coordinate, y_coordinate, direction = place_array

      position = Position.new(x_coordinate.to_i, y_coordinate.to_i, direction)
      @robot.safe_update_position position
    end

    def move
      return unless @robot.placed?

      new_position = @robot.current_position.move_forward
      @robot.safe_update_position new_position
    end

    def turn_left
      return unless @robot.placed?

      new_position = @robot.current_position.turn(:left)
      @robot.safe_update_position new_position
    end

    def turn_right
      return unless @robot.placed?

      new_position = @robot.current_position.turn(:right)
      @robot.safe_update_position new_position
    end

    def report
      return unless @robot.placed?

      current_position = @robot.current_position
      puts "Output: #{current_position.x_coordinate}, #{current_position.y_coordinate}, #{current_position.direction}"
    end
  end
end
