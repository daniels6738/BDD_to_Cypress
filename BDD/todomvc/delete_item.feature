Feature: Todo Item Deletion
  As a user
  I want to remove an item from my list
  So that I can clear out unneeded tasks

  Scenario: Delete an item by editing it to be empty
    Given I have a list of todo items including "feed the cat"
    When I edit the item "feed the cat" and leave the text empty
    Then the todo list should not contain the item "feed the cat"
