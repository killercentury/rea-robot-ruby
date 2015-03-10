#!/usr/bin/env ruby

# receive interactive commands from user
while command = gets.chomp
  break if command == 'quit'
  match = /^PLACE ([0-4]),([0-4]),(NORTH|EAST|SOUTH|WEST)/.match(command)
  if match
    puts 'Accepted'
  else
    puts 'Delined'
  end
end
