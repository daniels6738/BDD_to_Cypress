Feature: Todo List Filtering
  As a user
  I want to filter my todo list
  So that I can see only my active, un-completed tasks

  Scenario: Filter the list to show only active items
    Given I have a list of todo items
    And the item "feed the cat" is marked as complete
    When I filter the list by "Active"
    Then the todo list should only show active items
    And the list should not contain "feed the cat"
