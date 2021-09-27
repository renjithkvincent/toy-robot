module RobotSimulator
  class Table
    def initialize(options = {})
      default_width = 5
      default_height = 5
      @table_width = options[:width] || default_width
      @table_height = options[:height] || default_height
    end

    def within_table?(position)
      x_axis = position.x_coordinate
      y_axis = position.y_coordinate
      x_axis.between?(0, @table_width) && y_axis.between?(0, @table_height)
    end
  end
end
