require 'spec_helper'

module RobotSimulator
  describe CommandParser do
    let(:command_parser) { described_class.new }

    describe "class definition" do
      it "should be a part of RobotSimulator module" do
        expect(described_class).to be RobotSimulator::CommandParser
      end
    end

    describe "#valid_command?" do
      context  "with valid command" do
        let(:command_array1) { ['MOVE'] }
        let(:command_array2) { ['PLACE', '3,2,NORTH'] }
        let(:action1) { 'MOVE' }
        let(:action2) { 'PLACE' }
        let(:position_text) { '3,2,NORTH' }

        it "returns true" do
          expect(command_parser.valid_command?(command_array1, action1)).to eq true
          expect(command_parser.valid_command?(command_array2, action2, position_text)).to eq true
        end
      end

      context  "with invalid command" do
        let(:command_array) { ['MOVEEEEEE'] }
        let(:invalid_action) { 'MOVEEEEEE' }

        it "returns false" do
          expect(command_parser.valid_command?(command_array, invalid_action)).to eq false
        end
      end
    end

    describe "#valid_position?" do
      context  "with valid position text" do
        let(:position_text) { '0,3,SOUTH' }

        it "returns true" do
          expect(command_parser.valid_position?(position_text)).to eq true
        end
      end

      context  "with invalid position text" do
        let(:position_text) { '0,3,NORTH-WEST' }

        it "returns false" do
          expect(command_parser.valid_position?(position_text)).to eq false
        end
      end
    end
  end
end
