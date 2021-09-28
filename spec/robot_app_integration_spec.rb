require 'spec_helper'

RSpec.describe "integration" do
  describe "robot_app" do
    it "it moves, turns and prints the location" do
      expect do
        input_file = File.read("spec/test_data/command_list.txt")
        command_parser = RobotSimulator::CommandParser.new
        command_parser.execute_commands(input_file)
      end.to output("Output: 0, 3, WEST\n").to_stdout
    end
  end
end