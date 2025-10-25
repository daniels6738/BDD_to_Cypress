Feature: Clearing Completed Todos
  As a user
  I want to clear all completed items at once
  So that I can focus on my remaining tasks

  Scenario: Clear all completed items from the list
    Given I have a list of todo items
    And the item "feed the cat" is marked as complete
    When I click the "Clear completed" button
    Then the todo list should not contain the item "feed the cat"
    And the todo list should still contain "buy some cheese"
