require 'robot'

RSpec.describe Robot do
  describe '#set' do
    it 'is set to a position and orientation' do
      robot = Robot.new
      robot.set(0, 1, 'NORTH')
      expect(robot.report).to eq('0,1,NORTH')
    end
  end
  describe '#move' do
    context 'when it faces the north' do
      it 'moves 1 unit to the north' do
        robot = Robot.new
        robot.set(0, 0, 'NORTH')
        robot.move
        expect(robot.report).to eq('0,1,NORTH')
      end
    end
    context 'when it faces the east' do
      it 'moves 1 unit to the east' do
        robot = Robot.new
        robot.set(0, 0, 'EAST')
        robot.move
        expect(robot.report).to eq('1,0,EAST')
      end
    end
    context 'when it faces the south' do
      it 'moves 1 unit to the south' do
        robot = Robot.new
        robot.set(4, 4, 'SOUTH')
        robot.move
        expect(robot.report).to eq('4,3,SOUTH')
      end
    end
    context 'when it faces the west' do
      it 'moves 1 unit to the west' do
        robot = Robot.new
        robot.set(4, 4, 'WEST')
        robot.move
        expect(robot.report).to eq('3,4,WEST')
      end
    end
  end
  describe '#report' do
    it 'reports its current position and orientation' do
      robot = Robot.new
      robot.set(2, 3, 'EAST')
      expect(robot.report).to eq('2,3,EAST')
    end
  end
end
