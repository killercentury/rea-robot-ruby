require 'robot'

RSpec.describe Robot do
  describe "#set" do
    it "robot is set to (0,1) and face north" do
      robot = Robot.new
      robot.set(0, 1, 'NORTH')
      expect(robot.report).to eq('0,1,NORTH')
    end
  end
end
