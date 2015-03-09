Feature: App can read in commands

  As an user
  I want to enter the commands
  So that I can control the robot
  
  Scenario: Receive "PLACE X,Y,F" command
    Given I am using the command line
    And I run `app.rb` interactively
    And I type "hello"
    And I close the stdin stream
    Then the output should contain "olleh"
