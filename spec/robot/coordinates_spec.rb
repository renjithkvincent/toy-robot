require 'spec_helper'

module RobotSimulator
  describe Coordinates do
    describe "module definition" do
      it "should be a part of RobotSimulator module" do
        expect(Coordinates).to be RobotSimulator::Coordinates
      end
    end

    describe 'valid_directions' do
      it 'return the valid directions' do
        expect(described_class.valid_directions).to eq ['NORTH', 'SOUTH', 'EAST', 'WEST']
      end
    end

    describe 'step' do
      context 'North facing robot' do
        it 'x step is 0' do
          expect(described_class.step('NORTH', :forward_x)).to eq 0
        end

        it 'y step is 1' do
          expect(described_class.step('NORTH', :forward_y)).to eq 1
        end
      end

      context 'South facing robot' do
        it 'x step is 0' do
          expect(described_class.step('SOUTH', :forward_x)).to eq 0
        end

        it 'y step is -1' do
          expect(described_class.step('SOUTH', :forward_y)).to eq -1
        end
      end
    end

    describe 'direction' do
      context 'East facing robot' do
        it 'right turn points to South' do
          expect(described_class.direction('EAST', :right)).to eq 'SOUTH'
        end

        it 'left turn points to North ' do
          expect(described_class.direction('EAST', :left)).to eq 'NORTH'
        end
      end

      context 'West facing robot' do
        it 'x step is 0' do
          expect(described_class.direction('WEST', :right)).to eq 'NORTH'
        end

        it 'y step is -1' do
          expect(described_class.direction('WEST', :left)).to eq 'SOUTH'
        end
      end
    end
  end
end
