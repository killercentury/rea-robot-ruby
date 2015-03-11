Feature: App can read in commands

  As an user
  I want to enter the commands
  So that I can control the robot
  
  Scenario Outline: Receive valid "PLACE" command
    Given I am using the command line
    And I run `app.rb` interactively
    And I type "PLACE <X>,<Y>,<F>"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "<OUTPUT>"
    
    Examples:
      | X | Y | F     | OUTPUT    |
      | 0 | 4 | NORTH | 0,4,NORTH |
      | 1 | 3 | EAST  | 1,3,EAST  |
      | 2 | 2 | SOUTH | 2,2,SOUTH |
      | 4 | 0 | WEST  | 4,0,WEST  |
    
  Scenario Outline: Receive invalid "PLACE" command
    Given I am using the command line
    And I run `app.rb` interactively
    And I type "PLACE <X>,<Y>,<F>"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should not contain "<OUTPUT>"
    
    Examples:
      | X   | Y   | F     | OUTPUT    |
      | 0   | 5   | NORTH | 0,5,NORTH |
      | -1  | 4   | EAST  | -1,4,EAST |
      | 5   | 3   | SOUTH | 5,3,SOUTH |
      | 2   | -1  | WEST  | 2,-1,WEST |
      | 1   | 1   | HELLO | 1,1,HELLO |
