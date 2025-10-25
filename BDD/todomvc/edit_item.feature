Feature: Todo Item Editing
  As a user
  I want to edit an existing todo item
  So that I can correct mistakes or update tasks

  Scenario: Edit an existing todo item
    Given I have a todo item named "feed the cat"
    When I edit the item "feed the cat" to be "buy some sausages"
    Then the todo list should contain the item "buy some sausages"
    And the todo list should not contain the item "feed the cat"
