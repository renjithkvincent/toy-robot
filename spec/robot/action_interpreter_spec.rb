require 'spec_helper'

module RobotSimulator
  describe ActionInterpreter do
    let(:action_interpreter) { described_class.new }

    describe "class definition" do
      it "should be a part of RobotSimulator module" do
        expect(described_class).to be RobotSimulator::ActionInterpreter
      end
    end

    describe "#interpret" do
      context "place command" do
        let(:command) { 'PLACE' }
        let(:place_position) { '3,2,EAST' }
        let(:action_organizer) { action_interpreter.instance_variable_get(:@action_organizer) }

        it "calls organizer place" do
          expect(action_organizer).to receive(:place).with(place_position)
          action_interpreter.interpret(command, place_position)
        end
      end

      context "move command" do
        let(:command) { 'MOVE' }
        let(:action_organizer) { action_interpreter.instance_variable_get(:@action_organizer) }

        it "calls organizer move" do
          expect(action_organizer).to receive(:move)
          action_interpreter.interpret(command)
        end
      end

      context "turn right command" do
        let(:command) { 'RIGHT' }
        let(:action_organizer) { action_interpreter.instance_variable_get(:@action_organizer) }

        it "calls organizer turn right" do
          expect(action_organizer).to receive(:turn_right)
          action_interpreter.interpret(command)
        end
      end

      context "report command" do
        let(:command) { 'REPORT' }
        let(:action_organizer) { action_interpreter.instance_variable_get(:@action_organizer) }

        it "calls organizer report" do
          expect(action_organizer).to receive(:report)
          action_interpreter.interpret(command)
        end
      end

      context "invalid command" do
        let(:command) { 'HERE' }
        let(:action_organizer) { action_interpreter.instance_variable_get(:@action_organizer) }

        it "doesnt call any organizer method" do
          expect(action_organizer).to_not receive(:here)
          action_interpreter.interpret(command)
        end
      end
    end
  end
end
