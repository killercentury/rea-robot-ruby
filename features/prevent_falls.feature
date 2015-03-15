Feature: Robot can prevent itself from falling to destruction

  As an user
  I want the robot to prevent itself from falling from the table
  So that it can save itsel from destruction

  Scenario Outline: The robot is on the edge of the table
    Given I run `app.rb` interactively
    And I type "PLACE <ARGS>"
    When I type "MOVE"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "<OUTPUT>"

    Examples:
      | ARGS		| OUTPUT    |
      | 0,4,NORTH	| 0,4,NORTH |
      | 4,0,EAST  	| 4,0,EAST  |
      | 0,0,SOUTH	| 0,0,SOUTH |
      | 0,0,WEST	| 0,0,WEST  |

  Scenario: A combination of commands may lead to falling
    Given I run `app.rb` interactively
    And I type "PLACE 0,0,SOUTH"
    And I type "MOVE"
    And I type "RIGHT"
    And I type "MOVE"
    And I type "RIGHT"
    And I type "MOVE"
    When I type "REPORT"
    And I close the stdin stream
    Then the output should contain "0,1,NORTH"

  Scenario: Receive multiple random commands
  	Given I run `app.rb` interactively
  	And the robot receives "100" random commands
  	When I type "REPORT"
  	And I close the stdin stream
  	Then the output should match /^([0-4]),([0-4]),(NORTH|EAST|SOUTH|WEST)$/
