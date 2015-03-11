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
  describe '#turnLeft' do
    context 'when it faces the north' do
      it 'rotates counterclockwise 90% to the west' do
        robot = Robot.new
        robot.set(2, 2, 'NORTH')
        robot.turnLeft
        expect(robot.report).to eq('2,2,WEST')
      end
    end
    context 'when it faces the east' do
      it 'rotates counterclockwise 90% to the north' do
        robot = Robot.new
        robot.set(2, 2, 'EAST')
        robot.turnLeft
        expect(robot.report).to eq('2,2,NORTH')
      end
    end
    context 'when it faces the south' do
      it 'rotates counterclockwise 90% to the east' do
        robot = Robot.new
        robot.set(2, 2, 'SOUTH')
        robot.turnLeft
        expect(robot.report).to eq('2,2,EAST')
      end
    end
    context 'when it faces the west' do
      it 'rotates counterclockwise 90% to the south' do
        robot = Robot.new
        robot.set(2, 2, 'WEST')
        robot.turnLeft
        expect(robot.report).to eq('2,2,SOUTH')
      end
    end
  end
  describe '#turnRight' do
    context 'when it faces the north' do
      it 'rotates clockwise 90% to the east' do
        robot = Robot.new
        robot.set(2, 2, 'NORTH')
        robot.turnRight
        expect(robot.report).to eq('2,2,EAST')
      end
    end
    context 'when it faces the east' do
      it 'rotates clockwise 90% to the south' do
        robot = Robot.new
        robot.set(2, 2, 'EAST')
        robot.turnRight
        expect(robot.report).to eq('2,2,SOUTH')
      end
    end
    context 'when it faces the south' do
      it 'rotates clockwise 90% to the west' do
        robot = Robot.new
        robot.set(2, 2, 'SOUTH')
        robot.turnRight
        expect(robot.report).to eq('2,2,WEST')
      end
    end
    context 'when it faces the west' do
      it 'rotates clockwise 90% to the north' do
        robot = Robot.new
        robot.set(2, 2, 'WEST')
        robot.turnRight
        expect(robot.report).to eq('2,2,NORTH')
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
