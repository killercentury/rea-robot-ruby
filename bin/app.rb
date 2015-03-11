#!/usr/bin/env ruby

require_relative "../lib/robot.rb"

robot = Robot.new

# receive interactive commands from user
while command = gets.chomp
  break if command == 'quit'
  robot.receiveCommand(command)
end
