require 'robot'

RSpec.describe Robot do
  describe "#set" do
    it "is set to a position and orientation" do
      robot = Robot.new
      robot.set(0, 1, 'NORTH')
      expect(robot.report).to eq('0,1,NORTH')
    end
  end
  describe "#report" do
    it "reports its current position and orientation" do
      robot = Robot.new
      robot.set(2, 3, 'EAST')
      expect(robot.report).to eq('2,3,EAST')
    end
  end
end
