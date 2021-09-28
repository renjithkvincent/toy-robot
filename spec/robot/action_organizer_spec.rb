require 'spec_helper'

module RobotSimulator
  describe ActionOrganizer do
    let(:robot) { Robot.new }
    let(:action_organizer) { described_class.new(robot: robot) }
    let(:place_location) { '3,1,EAST' }

    describe "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(described_class).to be RobotSimulator::ActionOrganizer
      end
    end

    before(:each) do
      action_organizer.place(place_location)
    end

    describe "#place" do
      it "updates the robot position" do
        expect(robot.current_position.direction).to eq "EAST"
      end
    end

    describe "#move" do
      before do
        action_organizer.move
      end

      it "moves the robot forward and updates the position" do
        expect(robot.current_position.x_coordinate).to eq 4
      end
    end

    describe "#turn_left" do
      before do
        action_organizer.turn_left
      end

      it "moves the robot forward and updates the position" do
        expect(robot.current_position.direction).to eq "NORTH"
      end
    end

    describe "#turn_right" do
      before do
        action_organizer.turn_right
      end

      it "moves the robot forward and updates the position" do
        expect(robot.current_position.direction).to eq "SOUTH"
      end
    end

    describe "#report" do
      it "moves the robot forward and updates the position" do
        expect do
          (action_organizer.report)
        end.to output("Output: 3, 1, EAST\n").to_stdout
      end
    end
  end
end
