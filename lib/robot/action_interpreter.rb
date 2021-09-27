module RobotSimulator
  class ActionInterpreter
    def initialize
      @table = RobotSimulator::Table.new
      @robot = Robot.new(table: @table)
      @action_organizer = RobotSimulator::ActionOrganizer.new(robot: @robot)
    end

    def interpret(command, position = nil)
      case command
      when 'PLACE'
        @action_organizer.place(position)
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
  end
end
