module RobotSimulator
  class ActionInterpreter
    def initialize
      @table = RobotSimulator::Table.new
      @robot = Robot.new(table: @table)
      @action_organizer = RobotSimulator::ActionOrganizer.new(robot: @robot)
    end

    def execute_actions(action_file_name)
      File.open(action_file_name, 'r').each_line do |action|
        interpret(action)
      end
    end

    def interpret(action)
      action_array = action.split(' ')
      command = action_array[0]
      place_position = action_array[1]

      case command
      when 'PLACE'
        @action_organizer.place(place_position.split(',')) if valid_place?(place_position)
      when 'MOVE'
        @action_organizer.move
      when 'LEFT'
        @action_organizer.turn_left
      when 'RIGHT'
        @action_organizer.turn_right
      when 'REPORT'
        @action_organizer.report
      end
    end

    def valid_place?(position)
      return if position.nil?

      place_position = position.split(',')
      x_position = place_position[0]
      y_position = place_position[1]
      direction = place_position[2]
      return unless integer_string?(x_position) && integer_string?(y_position)

      @table.valid_directions.include? direction
    end

    def integer_string?(string)
      string.to_i.to_s == string
    end
  end
end
