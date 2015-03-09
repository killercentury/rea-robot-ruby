#!/usr/bin/env ruby

while command = gets.chomp
  break if command == "quit"
  puts command.reverse
end
