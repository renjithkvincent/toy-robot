require "spec_helper"

module RobotSimulator
  describe Robot do
    let(:position) { Position.new(3, 4, "NORTH") }
    let(:table) { Table.new({ width: 5, height: 5})}
    let(:robot) { described_class.new({ table: table }) }

    describe "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(described_class).to be RobotSimulator::Robot
      end
    end

    describe "#placed?" do
      context "with valid position" do
        before do
          robot.instance_variable_set(:@current_position, position)
        end

        it "returns true" do
          expect(robot.placed?).to eq true
        end
      end

      context "without a valid position" do
        it "returns true" do
          expect(robot.placed?).to eq false
        end
      end
    end

    describe "#safe_update_position" do
      context "with valid position" do
        before do
          robot.safe_update_position(position)
        end

        it "updates the current position" do
          expect(robot.current_position).to eq position
        end
      end

      context "with a position outside the table" do
        let(:invalid_position) { Position.new(8, 7, "EAST")}

        before do
          robot.safe_update_position(invalid_position)
        end

        it "doesnt update the current position" do
          expect(robot.current_position).not_to eq position
        end
      end
    end
  end
end
