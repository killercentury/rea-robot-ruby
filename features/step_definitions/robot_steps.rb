Given /^I am using the command line$/ do
end

Given /^the robot receives "([^"]*)" random commands$/ do |times|
  facings = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  # this arrary only include those commands will change the state of robot
  actionCommandTypes = ['PLACE', 'MOVE', 'LEFT', 'RIGHT']
  # this variable is only to handle the very small possibility of missing a place command
  hasPlaceCmd = false
  times.to_i.times do
    actionCommand = actionCommandTypes.sample
    case actionCommand
    when 'PLACE'
      type('PLACE' + ' ' + rand(5).to_s + ',' + rand(5).to_s + ',' + facings.sample)
      hasPlaceCmd = true
    when 'MOVE'
      type('MOVE')
    when 'LEFT'
      type('LEFT')
    when 'RIGHT'
      type('RIGHT')
    end
  end
  if hasPlaceCmd == false
  	type('PLACE' + ' ' + rand(5).to_s + ',' + rand(5).to_s + ',' + facings.sample)
  end
end
