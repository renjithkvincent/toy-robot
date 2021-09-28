require_relative "../lib/robot.rb"

input_file = File.read("data/command_list.txt")

command_parser = RobotSimulator::CommandParser.new
command_parser.execute_commands(input_file)

