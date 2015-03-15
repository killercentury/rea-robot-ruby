Feature: App can read in commands and route to the related method to execute

  In order to control the robot
  As an user
  I want to send the commands

  Scenario Outline: Receive valid "PLACE" command
    Given I run `app.rb` interactively
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
    Given I run `app.rb` interactively
    And I type "PLACE <X>,<Y>,<F>"
    And I type "REPORT"
    And I close the stdin stream
    Then the stdout should not contain anything

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

  Scenario: Receive other commands without a valid "PLACE" command
    Given I run `app.rb` interactively
    And I type "MOVE"
    And I type "LEFT"
    And I type "RIGHT"
    And I type "REPORT"
    And I close the stdin stream
    Then the stdout should not contain anything

  Scenario: Receive commands while the first valid "PLACE" command is in the middle
    Given I run `app.rb` interactively
    And I type "MOVE"
    And I type "LEFT"
    And I type "REPORT"
    And I type "PLACE 0,0,NORTH"
    And I type "REPORT"
    And I type "MOVE"
    And I type "RIGHT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain:
      """
      0,0,NORTH
      0,1,EAST
      """

  Scenario: Receive several "PLACE" commands with an invalid one in the middle
    Given I run `app.rb` interactively
    And I type "PLACE 0,0,NORTH"
    And I type "REPORT"
    And I type "PLACE 5,0,EAST"
    And I type "REPORT"
    And I type "PLACE 4,0,SOUTH"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should not contain "5,0,EAST"
    Then the output should contain:
      """
      0,0,NORTH
      4,0,SOUTH
      """
