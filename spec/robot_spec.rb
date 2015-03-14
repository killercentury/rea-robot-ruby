require 'robot'

RSpec.describe Robot do
  describe '#getStr' do
    it 'get its current position and facing as string' do
      robot = Robot.new
      robot.set(2, 3, 'EAST')
      expect(robot.getStr).to eq('2,3,EAST')
    end
  end

  describe '#set' do
    it 'is set to a position and facing' do
      robot = Robot.new
      robot.set(0, 1, 'NORTH')
      expect(robot.getStr).to eq('0,1,NORTH')
    end
  end

  describe '#move' do
    context 'when it faces the north' do
      it 'moves 1 unit to the north' do
        robot = Robot.new
        robot.set(0, 0, 'NORTH')
        robot.move
        expect(robot.getStr).to eq('0,1,NORTH')
      end
    end
    context 'when it faces the east' do
      it 'moves 1 unit to the east' do
        robot = Robot.new
        robot.set(0, 0, 'EAST')
        robot.move
        expect(robot.getStr).to eq('1,0,EAST')
      end
    end
    context 'when it faces the south' do
      it 'moves 1 unit to the south' do
        robot = Robot.new
        robot.set(4, 4, 'SOUTH')
        robot.move
        expect(robot.getStr).to eq('4,3,SOUTH')
      end
    end
    context 'when it faces the west' do
      it 'moves 1 unit to the west' do
        robot = Robot.new
        robot.set(4, 4, 'WEST')
        robot.move
        expect(robot.getStr).to eq('3,4,WEST')
      end
    end
  end

  describe '#turnLeft' do
    context 'when it faces the north' do
      it 'rotates counterclockwise 90 degrees to the west' do
        robot = Robot.new
        robot.set(2, 2, 'NORTH')
        robot.turnLeft
        expect(robot.getStr).to eq('2,2,WEST')
      end
    end
    context 'when it faces the east' do
      it 'rotates counterclockwise 90 degrees to the north' do
        robot = Robot.new
        robot.set(2, 2, 'EAST')
        robot.turnLeft
        expect(robot.getStr).to eq('2,2,NORTH')
      end
    end
    context 'when it faces the south' do
      it 'rotates counterclockwise 90 degress to the east' do
        robot = Robot.new
        robot.set(2, 2, 'SOUTH')
        robot.turnLeft
        expect(robot.getStr).to eq('2,2,EAST')
      end
    end
    context 'when it faces the west' do
      it 'rotates counterclockwise 90 degrees to the south' do
        robot = Robot.new
        robot.set(2, 2, 'WEST')
        robot.turnLeft
        expect(robot.getStr).to eq('2,2,SOUTH')
      end
    end
  end

  describe '#turnRight' do
    context 'when it faces the north' do
      it 'rotates clockwise 90 degrees to the east' do
        robot = Robot.new
        robot.set(2, 2, 'NORTH')
        robot.turnRight
        expect(robot.getStr).to eq('2,2,EAST')
      end
    end
    context 'when it faces the east' do
      it 'rotates clockwise 90 degrees to the south' do
        robot = Robot.new
        robot.set(2, 2, 'EAST')
        robot.turnRight
        expect(robot.getStr).to eq('2,2,SOUTH')
      end
    end
    context 'when it faces the south' do
      it 'rotates clockwise 90 degrees to the west' do
        robot = Robot.new
        robot.set(2, 2, 'SOUTH')
        robot.turnRight
        expect(robot.getStr).to eq('2,2,WEST')
      end
    end
    context 'when it faces the west' do
      it 'rotates clockwise 90 degrees to the north' do
        robot = Robot.new
        robot.set(2, 2, 'WEST')
        robot.turnRight
        expect(robot.getStr).to eq('2,2,NORTH')
      end
    end
  end

  describe '#isOnTable' do
    context 'when it is on the table' do
      let(:robot) { Robot.new(0, 0, 'NORTH') }
      it 'returns true' do
      	expect(robot.isOnTable).to eq(true)
      end
    end
    context 'when it is not on the table' do
      let(:robot) { Robot.new }
      it 'returns false' do
      	expect(robot.isOnTable).to eq(false)
      end
    end
  end

  describe '#receiveCommand' do
    context 'when it is a valid PLACE command' do
      let(:robot) { Robot.new(0, 0, 'NORTH') }
      it 'executes the PLACE command' do
        expect(robot.receiveCommand('PLACE 4,4,SOUTH')).to eq(true)
        expect(robot.getStr).to eq('4,4,SOUTH')
      end
    end
    context 'when it is an invalid PLACE command' do
      let(:robot) { Robot.new(0, 0, 'NORTH') }
      it 'ignores the PLACE command' do
        expect(robot.receiveCommand('PLACE 5,0,NORTH')).to eq(false)
        expect(robot.getStr).not_to eq('5,0,NORTH')
      end
    end
    context 'when it has not received the first valid PLACE command' do
      let(:robot) { Robot.new }
      context 'when it receives a MOVE command' do
        it 'ignores the MOVE command' do
          expect(robot.receiveCommand('MOVE')).to eq(false)
          expect(robot.getStr).to eq('Robot is not on the table')
        end
      end
      context 'when it receives a LEFT command' do
        it 'ignores the LEFT command' do
          expect(robot.receiveCommand('LEFT')).to eq(false)
          expect(robot.getStr).to eq('Robot is not on the table')
        end
      end
      context 'when it receives a RIGHT command' do
        it 'ignores the RIGHT command' do
          robot.receiveCommand('RIGHT')
          expect(robot.receiveCommand('RIGHT')).to eq(false)
          expect(robot.getStr).to eq('Robot is not on the table')
        end
      end
    end
    context 'when it has been on the table' do
      let(:robot) { Robot.new(0, 0, 'NORTH') }
      context 'when it receives a MOVE command' do
        it 'executes the MOVE command' do
          expect(robot.receiveCommand('MOVE')).to eq(true)
          expect(robot.getStr).to eq('0,1,NORTH')
        end
      end
      context 'when it receives a LEFT command' do
        it 'executes the LEFT command' do
          expect(robot.receiveCommand('LEFT')).to eq(true)
          expect(robot.getStr).to eq('0,0,WEST')
        end
      end
      context 'when it receives a RIGHT command' do
        it 'executes the RIGHT command' do
          expect(robot.receiveCommand('RIGHT')).to eq(true)
          expect(robot.getStr).to eq('0,0,EAST')
        end
      end
    end
  end
end
