require 'spec_helper'

module RobotSimulator
  describe Table do
    let(:table) { described_class.new({ height: 5, width: 5 })}

    describe "class definition" do
      it "should be a part of RobotSimulator module" do
        expect(described_class).to be RobotSimulator::Table
      end
    end

    describe "#within_table?" do
      context "with position within table" do
        let(:valid_position) { Position.new(3, 4, 'NORTH') }

        it "returns true" do
          expect(table.within_table?(valid_position)).to eq true
        end
      end

      context "with position outside table" do
        let(:out_of_bounds_position) { Position.new(9, 4, 'NORTH') }

        it "returns false" do
          expect(table.within_table?(out_of_bounds_position)).to eq false
        end
      end

      context "with invalid position" do
        let(:invalid_position) { Position.new(5, 'abcd', 'UPWARDS') }

        it "returns false" do
          expect(table.within_table?(invalid_position)).to eq false
        end
      end
    end
  end
end
