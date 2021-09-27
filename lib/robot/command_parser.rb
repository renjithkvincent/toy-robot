module RobotSimulator
  class CommandParser
    def initialize
      @action_interpreter = ActionInterpreter.new
      @valid_actions = %w[PLACE MOVE LEFT RIGHT REPORT]
      @place_action = 'PLACE'
      @coordinates = Coordinates
    end

    def execute_commands(action_file_name)
      File.open(action_file_name, 'r').each_line do |command|
        interpret_valid_command(command)
      end
    end

    def interpret_valid_command(command)
      command_array = command.split(' ')
      action, position_text = command_array

      return unless valid_command?(command_array, action, position_text)

      @action_interpreter.interpret(action, position_text)
    end

    def valid_command?(command_array, action, position_text)
      return unless @valid_actions.include? action

      action == @place_action ? valid_position?(position_text) : command_array.one?
    end

    def valid_position?(position_text)
      return if position_text.nil?

      position_array = position_text.split(',')
      return unless position_array.length == 3

      x_position, y_position, direction = position_array
      return unless integer_string?(x_position) && integer_string?(y_position)

      @coordinates.valid_directions.include? direction
    end

    def integer_string?(string)
      string.to_i.to_s == string
    end
  end
end
