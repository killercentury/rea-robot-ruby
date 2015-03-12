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
    Then the output should contain ""
    
    Examples:
      | X   | Y   | F     |
      | 0   | 5   | NORTH |
      | -1  | 4   | EAST  |
      | 5   | 3   | SOUTH |
      | 2   | -1  | WEST  |
      | 1   | 1   | HELLO |

  Scenario: Receive "MOVE" command after a valid "PLACE" command
    Given I run `app.rb` interactively
    And I type "PLACE 0,0,NORTH"
    And I type "MOVE"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "0,1,NORTH"

  Scenario: Receive "LEFT" command after a valid "PLACE" command
    Given I run `app.rb` interactively
    And I type "PLACE 0,0,NORTH"
    And I type "LEFT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "0,0,WEST"

  Scenario: Receive "LEFT" command after a valid "PLACE" command
    Given I run `app.rb` interactively
    And I type "PLACE 0,0,NORTH"
    And I type "RIGHT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "0,0,EAST"

  Scenario: Receive other commands before a valid "PLACE" command
    Given I run `app.rb` interactively
    And I type "MOVE"
    And I type "LEFT"
    And I type "RIGHT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain ""
