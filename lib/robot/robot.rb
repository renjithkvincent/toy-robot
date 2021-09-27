module RobotSimulator
  class Robot
    attr_reader :current_position

    def initialize(options = {})
      @table = options[:table] || Table.new
      @current_position = nil
    end

    def placed?
      !@current_position.nil?
    end

    def safe_update_position(position)
      @current_position = position if @table.within_table?(position)
    end
  end
end
