require "spec_helper"

module RobotSimulator
  describe Position do
    let(:position) { described_class.new(1, 3, 'NORTH') }

    describe "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(described_class).to be RobotSimulator::Position
      end
    end

    describe "move_forward" do
      it "moves and returns the new position" do
        expect(position.move_forward).to be_an_instance_of(described_class)
        expect(position.move_forward.y_coordinate).to eq 4
      end
    end

    describe "turn" do
      it "turns to a direction and returns the new position" do
        expect(position.turn(:left)).to be_an_instance_of(described_class)
        expect(position.turn(:left).direction).to eq 'WEST'
      end
    end
  end
end
