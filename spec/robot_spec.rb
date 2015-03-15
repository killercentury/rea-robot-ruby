require 'robot'

RSpec.describe Robot do

  describe '#initialize' do
    context 'when there is no argument' do
      it 'creates a robot object without intial positionn and facing' do
        robot = Robot.new
        expect(robot.x).to be_nil
        expect(robot.y).to be_nil
        expect(robot.f).to be_nil
      end
    end
    context 'when there is argument' do
      robot = Robot.new(1, 3, 'NORTH')
      it 'creates a robot object with intial positionn and facing' do
        expect(robot.x).to eq(1)
        expect(robot.y).to eq(3)
        expect(robot.f).to eq('NORTH')
      end
    end
  end

  describe '#isInitialized' do
    context 'when it is initialized' do
      let(:robot) { Robot.new(0, 0, 'NORTH') }
      it 'returns true' do
        expect(robot.isInitialized).to eq(true)
      end
    end
    context 'when it is not initialized' do
      let(:robot) { Robot.new }
      it 'returns false' do
        expect(robot.isInitialized).to eq(false)
      end
    end
  end

  describe '#getStr' do
    context 'when it is on the table' do
      let(:robot) { Robot.new(1, 3, 'NORTH') }
      it 'get its current position and facing as string' do
        expect(robot.getStr).to eq('1,3,NORTH')
      end
    end
    context 'when has not been on the table' do
      let(:robot) { Robot.new }
      it 'return its state as string' do
        expect(robot.getStr).to eq('Robot has not been on the table')
      end
    end
    context 'when has fallen from the table' do
      let(:robot) { Robot.new(5, -1, 'NORTH') }
      it 'return its state as string' do
        expect(robot.getStr).to eq('Robot has fallen from the table')
      end
    end
  end

  describe '#set' do
    context 'when it is on the table' do
      let(:robot) { Robot.new(0, 4, 'EAST') }
      context 'when the arguments are valid' do
        it 'is set to the new position and facing' do
          robot.set(3, 1, 'SOUTH')
          expect(robot.x).to eq(3)
          expect(robot.y).to eq(1)
          expect(robot.f).to eq('SOUTH')
        end
      end
      context 'when the arguments are invalid' do
        it 'stays the same' do
          robot.set(5, 1, 'SOUTH')
          expect(robot.x).to eq(0)
          expect(robot.y).to eq(4)
          expect(robot.f).to eq('EAST')
        end
      end
    end
    context 'when has not been on the table' do
      let(:robot) { Robot.new }
      context 'when the arguments are valid' do
        it 'is set to a position and facing' do
          robot.set(0, 4, 'WEST')
          expect(robot.x).to eq(0)
          expect(robot.y).to eq(4)
          expect(robot.f).to eq('WEST')
        end
      end
      context 'when the arguments are invalid' do
        it 'stays the same' do
          robot.set(0, -1, 'WEST')
          expect(robot.x).to be_nil
          expect(robot.y).to be_nil
          expect(robot.f).to be_nil
        end
      end
    end
  end

  describe '#move' do
    context 'when it is on the table' do
      context 'when it faces the north' do
        context 'when it is not on the northern boundary' do
          let(:robot) { Robot.new(0, 0, 'NORTH') }
          it 'moves 1 unit to the north' do
            robot.move
            expect(robot.x).to eq(0)
            expect(robot.y).to eq(1)
            expect(robot.f).to eq('NORTH')
          end
        end
        context 'when it is on the northern boundary' do
          let(:robot) { Robot.new(0, 4, 'NORTH') }
          it 'does not move forward' do
            robot.move
            expect(robot.x).to eq(0)
            expect(robot.y).to eq(4)
            expect(robot.f).to eq('NORTH')
          end
        end
      end
      context 'when it faces the east' do
        context 'when it is not on the eastern boundary' do
          let(:robot) { Robot.new(1, 1, 'EAST') }
          it 'moves 1 unit to the east' do
            robot.move
            expect(robot.x).to eq(2)
            expect(robot.y).to eq(1)
            expect(robot.f).to eq('EAST')
          end
        end
        context 'when it is on the eastern boundary' do
          let(:robot) { Robot.new(4, 1, 'EAST') }
          it 'does not move forward' do
            robot.move
            expect(robot.x).to eq(4)
            expect(robot.y).to eq(1)
            expect(robot.f).to eq('EAST')
          end
        end
      end
      context 'when it faces the south' do
        context 'when it is not on the southern boundary' do
          let(:robot) { Robot.new(4, 4, 'SOUTH') }
          it 'moves 1 unit to the south' do
            robot.move
            expect(robot.x).to eq(4)
            expect(robot.y).to eq(3)
            expect(robot.f).to eq('SOUTH')
          end
        end
        context 'when it is on the southern boundary' do
          let(:robot) { Robot.new(4, 0, 'SOUTH') }
          it 'does not move forward' do
            robot.move
            expect(robot.x).to eq(4)
            expect(robot.y).to eq(0)
            expect(robot.f).to eq('SOUTH')
          end
        end
      end
      context 'when it faces the west' do
        context 'when it is not on the western boundary' do
          let(:robot) { Robot.new(3, 3, 'WEST') }
          it 'moves 1 unit to the west' do
            robot.move
            expect(robot.x).to eq(2)
            expect(robot.y).to eq(3)
            expect(robot.f).to eq('WEST')
          end
        end
        context 'when it is on the western boundary' do
          let(:robot) { Robot.new(0, 3, 'WEST') }
          it 'does not move forward' do
            robot.move
            expect(robot.x).to eq(0)
            expect(robot.y).to eq(3)
            expect(robot.f).to eq('WEST')
          end
        end
      end
    end
    context 'when it is not on the table' do
      let(:robot) { Robot.new }
      it 'stays the same' do
        robot.move
        expect(robot.x).to be_nil
        expect(robot.y).to be_nil
        expect(robot.f).to be_nil
      end
    end
  end

  describe '#turnLeft' do
    context 'when it is on the table' do
      context 'when it faces the north' do
        let(:robot) { Robot.new(2, 2, 'NORTH') }
        it 'rotates counterclockwise 90 degrees to the west' do
          robot.turnLeft
          expect(robot.x).to eq(2)
          expect(robot.y).to eq(2)
          expect(robot.f).to eq('WEST')
        end
      end
      context 'when it faces the east' do
        let(:robot) { Robot.new(2, 2, 'EAST') }
        it 'rotates counterclockwise 90 degrees to the north' do
          robot.turnLeft
          expect(robot.x).to eq(2)
          expect(robot.y).to eq(2)
          expect(robot.f).to eq('NORTH')
        end
      end
      context 'when it faces the south' do
        let(:robot) { Robot.new(2, 2, 'SOUTH') }
        it 'rotates counterclockwise 90 degress to the east' do
          robot.turnLeft
          expect(robot.x).to eq(2)
          expect(robot.y).to eq(2)
          expect(robot.f).to eq('EAST')
        end
      end
      context 'when it faces the west' do
        let(:robot) { Robot.new(2, 2, 'WEST') }
        it 'rotates counterclockwise 90 degrees to the south' do
          robot.turnLeft
          expect(robot.x).to eq(2)
          expect(robot.y).to eq(2)
          expect(robot.f).to eq('SOUTH')
        end
      end
    end
    context 'when it is not on the table' do
      let(:robot) { Robot.new }
      it 'stays the same' do
        robot.turnLeft
        expect(robot.x).to be_nil
        expect(robot.y).to be_nil
        expect(robot.f).to be_nil
      end
    end
  end

  describe '#turnRight' do
    context 'when it is on the table' do
      context 'when it faces the north' do
        let(:robot) { Robot.new(2, 2, 'NORTH') }
        it 'rotates clockwise 90 degrees to the east' do
          robot.turnRight
          expect(robot.x).to eq(2)
          expect(robot.y).to eq(2)
          expect(robot.f).to eq('EAST')
        end
      end
      context 'when it faces the east' do
        let(:robot) { Robot.new(2, 2, 'EAST') }
        it 'rotates clockwise 90 degrees to the south' do
          robot.turnRight
          expect(robot.x).to eq(2)
          expect(robot.y).to eq(2)
          expect(robot.f).to eq('SOUTH')
        end
      end
      context 'when it faces the south' do
        let(:robot) { Robot.new(2, 2, 'SOUTH') }
        it 'rotates clockwise 90 degrees to the west' do
          robot.turnRight
          expect(robot.x).to eq(2)
          expect(robot.y).to eq(2)
          expect(robot.f).to eq('WEST')
        end
      end
      context 'when it faces the west' do
        let(:robot) { Robot.new(2, 2, 'WEST') }
        it 'rotates clockwise 90 degrees to the north' do
          robot.turnRight
          expect(robot.x).to eq(2)
          expect(robot.y).to eq(2)
          expect(robot.f).to eq('NORTH')
        end
      end
    end
    context 'when it is not on the table' do
      let(:robot) { Robot.new }
      it 'stays the same' do
        robot.turnRight
        expect(robot.x).to be_nil
        expect(robot.y).to be_nil
        expect(robot.f).to be_nil
      end
    end
  end

  describe '#report' do
    context 'when it is on the table' do
      let(:robot) { Robot.new(0, 0, 'NORTH') }
      it 'returns true' do
        expect{robot.report}.to output(/0,0,NORTH/).to_stdout
      end
    end
    context 'when it is not on the table' do
      let(:robot) { Robot.new }
      it 'returns false' do
        expect{robot.isInitialized}.to_not output.to_stdout
      end
    end
  end

  describe '#receiveCommand' do
    context 'when it is a valid PLACE command' do
      let(:robot) { Robot.new(0, 0, 'NORTH') }
      it 'executes the PLACE command' do
        expect(robot.receiveCommand('PLACE 4,4,SOUTH')).to eq(true)
        expect(robot.x).to eq(4)
        expect(robot.y).to eq(4)
        expect(robot.f).to eq('SOUTH')
      end
    end
    context 'when it is an invalid PLACE command' do
      let(:robot) { Robot.new(0, 0, 'NORTH') }
      it 'ignores the PLACE command' do
        expect(robot.receiveCommand('PLACE 5,3,SOUTH')).to eq(false)
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
        expect(robot.f).to eq('NORTH')
      end
    end
    context 'when it has not received the first valid PLACE command' do
      let(:robot) { Robot.new }
      context 'when it receives a MOVE command' do
        it 'ignores the MOVE command' do
          expect(robot.receiveCommand('MOVE')).to eq(true)
          expect(robot.isInitialized).to eq(false)
        end
      end
      context 'when it receives a LEFT command' do
        it 'ignores the LEFT command' do
          expect(robot.receiveCommand('LEFT')).to eq(true)
          expect(robot.isInitialized).to eq(false)
        end
      end
      context 'when it receives a RIGHT command' do
        it 'ignores the RIGHT command' do
          robot.receiveCommand('RIGHT')
          expect(robot.receiveCommand('RIGHT')).to eq(true)
          expect(robot.isInitialized).to eq(false)
        end
      end
    end
    context 'when it has been on the table' do
      let(:robot) { Robot.new(0, 0, 'NORTH') }
      context 'when it receives a MOVE command' do
        it 'executes the MOVE command' do
          expect(robot.receiveCommand('MOVE')).to eq(true)
          expect(robot.x).to eq(0)
          expect(robot.y).to eq(1)
          expect(robot.f).to eq('NORTH')
        end
      end
      context 'when it receives a LEFT command' do
        it 'executes the LEFT command' do
          expect(robot.receiveCommand('LEFT')).to eq(true)
          expect(robot.x).to eq(0)
          expect(robot.y).to eq(0)
          expect(robot.f).to eq('WEST')
        end
      end
      context 'when it receives a RIGHT command' do
        it 'executes the RIGHT command' do
          expect(robot.receiveCommand('RIGHT')).to eq(true)
          expect(robot.x).to eq(0)
          expect(robot.y).to eq(0)
          expect(robot.f).to eq('EAST')
        end
      end
    end
    context 'when it receives invalid command' do
      let(:robot) { Robot.new(0, 0, 'NORTH') }
      it 'ignores the invalid command' do
        expect(robot.receiveCommand('HELLO')).to eq(false)
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
        expect(robot.f).to eq('NORTH')
      end
    end
  end
end
