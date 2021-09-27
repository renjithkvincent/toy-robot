module RobotSimulator
  module Coordinates
    def self.valid_directions
      %w[NORTH SOUTH EAST WEST]
    end

    def self.step(direction, action)
      {
        NORTH: {
          forward_x: 0,
          forward_y: 1
        },
        SOUTH: {
          forward_x: 0,
          forward_y: -1
        },
        WEST: {
          forward_x: -1,
          forward_y: 0
        },
        EAST: {
          forward_x: 1,
          forward_y: 0
        }
      }[direction.to_sym][action]
    end

    def self.direction(direction, action)
      {
        NORTH: {
          left: 'WEST',
          right: 'EAST'
        },
        SOUTH: {
          left: 'EAST',
          right: 'WEST'
        },
        WEST: {
          left: 'SOUTH',
          right: 'NORTH'
        },
        EAST: {
          left: 'NORTH',
          right: 'SOUTH'
        }
      }[direction.to_sym][action]
    end
  end
end
